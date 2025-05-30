struct Data {
  foo: Int;
  bar: Bool?;
}

contract Test {
  s: Data?;
  init() {
    self.s = Data{ foo: 1, bar: true };
  }
}