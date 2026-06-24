struct Complex {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
  k: Cell?;
  l: Slice?;
}

contract ComplexStorage {
  f1: Complex;
  f2: Complex?;

  init() {
    let v = Complex{
      a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
      g:2, h:false, i:null, j:null, k:null, l:null
    };
    self.f1 = v;
    self.f2 = v;
  }
}