struct Data {
  x: Int;
}

contract OptionalStruct {
  s: Data?;
  init() {
    self.s = null;
  }

  receive() {
    self.s = Data{ x: 42 };
  }
}