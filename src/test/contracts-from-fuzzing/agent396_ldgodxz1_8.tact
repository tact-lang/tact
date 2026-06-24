struct SubData {
  a: Int;
  b: Bool;
}

struct Complex {
  one: Int;
  two: SubData;
  rest: Slice as remaining;
}

contract Test {
  c: Complex;

  init() {
    self.c = Complex {
      one: 1,
      two: SubData { a: 2, b: true },
      rest: emptyCell().asSlice(),
    };
  }
  receive() { return; }
}