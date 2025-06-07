struct Simple {
  a: Int;
}

contract Test {
  s: Simple;
  init() {
    self.s = Simple{ a: 1 };
  }
}