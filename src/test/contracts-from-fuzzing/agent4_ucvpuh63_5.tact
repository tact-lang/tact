struct Complex {
  a: Int;
  b: Int?;
  c: String;
  d: String?;
  e: Cell;
  f: Cell?;
  g: Address;
  h: Address?;
}

contract Test {
  complex: Complex;

  init() {
    self.complex = Complex{
      a: 1,
      b: null,
      c: "hello",
      d: null,
      e: emptyCell(),
      f: null,
      g: myAddress(),
      h: null
    };
  }
}