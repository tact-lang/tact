struct Sub {
  f: Int;
}

contract OptionalStructInitNull {
  s: Sub?;
  init() {
    self.s = null;
  }
}