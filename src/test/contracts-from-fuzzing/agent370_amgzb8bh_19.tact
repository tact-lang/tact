struct SOpt {
  inner: Int?;
}

contract OptionalStructField {
  d: SOpt?;

  init() {
    self.d = null;
  }
}