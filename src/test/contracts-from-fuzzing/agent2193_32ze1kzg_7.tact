struct Complex {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Slice;
}

contract TestContract {
  storage: Complex;

  init() {
    self.storage = Complex{
      a: 1,
      b: false,
      c: "test",
      d: emptyCell(),
      e: myAddress(),
      f: emptyCell().asSlice()
    };
  }
}