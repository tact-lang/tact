struct Optionals {
  intOpt: Int?;
  boolOpt: Bool?;
}

contract OptionalStructsMix {
  optA: Optionals?;
  optB: Optionals?;

  init() {
    self.optA = null;
    self.optB = null;
  }

  receive() {}
}