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

contract OptFields {
  val: Complex;

  init() {
    self.val = Complex{
      a: 1,
      b: true,
      c: "hi",
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