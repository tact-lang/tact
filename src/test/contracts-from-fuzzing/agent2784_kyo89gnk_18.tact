struct BasicWrapped {
 a: Int;
 b: Bool;
}

contract WrappedField {
  inner: BasicWrapped;

  init() {
    self.inner = BasicWrapped{ a: 123, b: false };
  }
}