struct SInner {
  foo: Int;
  bar: Bool;
}

contract OptionalStructField {
  nested: SInner?;

  init() {
    self.nested = null;
  }
}