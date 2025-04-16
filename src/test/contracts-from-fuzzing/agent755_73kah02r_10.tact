struct Data {
  foo: Int;
  bar: String;
}

contract Test8 {
  data: Data?;

  init() {
    self.data = null;
  }
}
