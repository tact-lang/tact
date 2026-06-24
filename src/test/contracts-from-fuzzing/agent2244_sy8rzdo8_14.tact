struct InnerStr {
  foo: String;
}

contract OptionalStructField {
  optionalInner: InnerStr?;

  init() {
    self.optionalInner = null;
  }
}
