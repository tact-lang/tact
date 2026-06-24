struct InnerOption {
  value: Int?;
}

contract OptionalStructInOptional {
  optInner: InnerOption?;

  init() {
    self.optInner = null;
  }
}