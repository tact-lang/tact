struct Inner {
  a: Int;
  b: String;
  c: Bool;
}

contract Test {
  data: Inner;
  init() {
    self.data = Inner{a: 1, b: "hello", c: true};
  }
}