FROM python:3.7-alpine
MAINTAINER Adrian Sampson <asampson@cs.cornell.edu>

# Add pipenv for buildbot.
RUN pip install pipenv

# Add OCaml and enough dependencies to build OCaml packages.
RUN apk add --no-cache opam ocaml-compiler-libs bash m4 build-base git
RUN opam init -y

# Our OCaml dependencies. We already have ocamlbuild, so we have a workaround:
# https://github.com/ocaml/ocamlbuild/issues/109
ENV CHECK_IF_PREINSTALLED=false
RUN opam install dune menhir

# Add opam bin directory to our $PATH so we can run seac.
ENV PATH /root/.opam/system/bin:${PATH}

# Volume, port, and command for buildbot.
VOLUME seashell/buildbot/instance
EXPOSE 8000
CMD ["make", "-C", "buildbot", "serve"]

# Add Seashell source.
ADD . seashell
WORKDIR seashell

# Build Seashell.
RUN eval `opam config env` ; dune build
RUN eval `opam config env` ; dune install

# Set up buildbot.
RUN cd buildbot ; pipenv install