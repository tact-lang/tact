struct InnerOptional {
  s: String?;
}

contract OptionalStructField {
  opt: InnerOptional;

  init() {
    self.opt = InnerOptional{ s: null };
  }
}