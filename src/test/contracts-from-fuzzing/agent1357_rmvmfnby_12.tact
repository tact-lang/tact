struct Data {
  x: Int;
}

contract OptionalStruct {
  maybeData: Data?;

  init() {
    self.maybeData = Data{ x: 100 };
  }
}