struct Inner {
  x: Int;
  flag: Bool;
}

contract OptionalStructField {
  optNested: Inner? = null;

  receive() {
    self.optNested = self.optNested;
  }
}