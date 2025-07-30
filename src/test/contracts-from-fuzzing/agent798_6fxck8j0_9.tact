struct DefOpt {
  x: Int? = null;
  y: Bool? = null;
  z: Address? = null;
}

contract DefaultOpt {
  s: DefOpt;

  init() {
    self.s = DefOpt{};
  }
}