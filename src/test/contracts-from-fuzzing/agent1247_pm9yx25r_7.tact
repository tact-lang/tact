struct Complex {
  a: Int;
  b: Bool?;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
}

contract ManyTypes {
  data: Complex;

  init() {
    self.data = Complex{
      a: 5,
      b: null,
      c: myAddress(),
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: "hello"
    };
  }
}