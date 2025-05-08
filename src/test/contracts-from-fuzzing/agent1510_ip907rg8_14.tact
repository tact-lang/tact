struct Inner {
  a: Int;
}

contract OptionalStructField {
  field: Inner?;

  init() {
    self.field = null;
  }
}