struct Complex {
  s: String;
  i: Int;
  b: Bool;
  c: Cell;
  sl: Slice;
  a: Address;
}

contract MultiComplex {
  field1: Complex;
  field2: Complex;

  init() {
    self.field1 = Complex{s:"x", i:1, b:true, c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress()};
    self.field2 = Complex{s:"y", i:2, b:false, c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress()};
  }
}