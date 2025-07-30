struct InnerSimple {
  x: Int;
}

contract OptionalStructTopLevel {
  s: InnerSimple?;

  init() {
    self.s = null;
  }
}