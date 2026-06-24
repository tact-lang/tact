struct Complex {
  a: Int; 
  b: Bool; 
  c: Cell; 
  d: Address; 
  e: Slice; 
  f: String; 
  g: Int?; 
  h: Bool?;
  i: Cell?;
  j: Address?;
  k: Slice?;
  l: String?;
}

contract Test {
  complexField: Complex;

  init() {
    self.complexField = Complex{
      a:1, b:true, c:emptyCell(), d:myAddress(), e:emptyCell().asSlice(), f:"abc",
      g:null, h:null, i:null, j:null, k:null, l:null
    };
  }
}