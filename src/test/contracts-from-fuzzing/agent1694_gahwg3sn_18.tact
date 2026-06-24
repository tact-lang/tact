struct Complex {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Cell?;
  k: Slice?;
  l: Address?;
}

contract ComboTest {
  val: Complex;

  init() {
    self.val = Complex{
      a: 1,
      b: false,
      c: "abc",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress(),
      g: null,
      h: null,
      i: null,
      j: null,
      k: null,
      l: null
    };
  }
}