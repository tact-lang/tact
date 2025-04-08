struct Complex {
  a: Int;
  b: Bool;
  c: Cell;
  d: Slice;
  e: Address;
  f: String;
  g: Int?;
  h: Bool?;
  i: Cell?;
  j: Slice?;
  k: Address?;
  l: String?;
}

contract VariousTypesContract {
  cf: Complex;

  init() {
    self.cf = Complex{
      a: 1, b: true, c: emptyCell(), d: emptyCell().asSlice(), e: myAddress(),
      f: "hi", g: 2, h: false, i: null, j: null, k: null, l: null
    };
  }
}