struct OptInner {
  foo: Int;
  bar: Bool?;
}

contract TestContract {
  optField: OptInner?;

  init() {
    self.optField = OptInner{ foo: 7, bar: true };
  }
}