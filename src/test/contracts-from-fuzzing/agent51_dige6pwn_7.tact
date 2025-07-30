struct Optionals {
  foo: Bool?;
  bar: String?;
}

contract Test {
  data: Optionals?;
  init() {
    self.data = null;
  }
}