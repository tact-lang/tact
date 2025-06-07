struct Inner {
  foo: Int;
}

contract OptionalStruct {
  data: Inner?;

  init() {
    self.data = Inner{ foo: 42 };
  }
}
