struct Sub {
  s: String;
}

contract OptionalStructField {
  opt: Sub?;

  init() {
    self.opt = null;
  }
}