package fuselang.common

import java.io.File
import scribe.Level

case class Config(
  srcFile: File, // Required: Name of the source file
  kernelName: String = "kernel", // Name of the kernel to emit
  output: Option[String] = None, // Name of output file.
                                 // backend: Backend = VivadoBackend
                                 // mode: Mode = Compile, // Compilation mode
  compilerOpts: List[String] = List(),
  logLevel: Level = Level.Info,
  header: Boolean = false
)
