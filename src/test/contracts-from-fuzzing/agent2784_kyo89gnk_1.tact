struct Inner { a: Int; b: Bool; }

contract Test {
  x: Inner;

  init() {
    self.x = Inner{a: 1, b: true};
  }
}
