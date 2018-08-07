/////////////////////////////////////////////
// matrix matrix add
// - This application uses two banked matrices as input,
// one banked matrix as output, nested loops for each dimension, 
// regular banking in one dimension with each unroll 
// accessing different bank and all operands being matrices of
// same parameters..
////////////////////////////////////////////

func madd(a: float[1024 bank(32)], b: float[1024 bank(32)], c: float[1024 bank(32)]) {

  for (let i = 0..31) {
    for (let j = 0..31) unroll 32 {
      c[i][j] := a[i][j] + b[i][j];
    } 
  } 

}