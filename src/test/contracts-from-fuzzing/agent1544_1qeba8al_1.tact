contract OptionalStructs {
  data: Inner?;

  init() {
    self.data = null;
  }
}

struct Inner {
  foo: Int;
  bar: Bool;
}
