struct InnerOptional {
  str: String?;
  num: Int?;
}

contract OptionalStructField {
  inner: InnerOptional?;

  init() {
    self.inner = null;
  }
}