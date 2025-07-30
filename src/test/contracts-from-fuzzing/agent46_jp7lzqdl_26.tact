struct Tiny {
  a: Int;
}

contract OptionalTiny {
  t: Tiny?;

  init() {
    self.t = null;
  }
}
