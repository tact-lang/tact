struct Complex {
  a: Int;
  b: Bool?;
  c: String;
  d: String?;
  e: Cell;
  f: Cell?;
  g: Slice;
  h: Slice?;
  i: Address;
  j: Address?;
}

contract ComplexFieldsTest {
  data: Complex;

  init() {
    self.data = Complex{
      a: 10,
      b: null,
      c: "test",
      d: null,
      e: emptyCell(),
      f: null,
      g: emptyCell().asSlice(),
      h: null,
      i: myAddress(),
      j: null,
    };
  }
}