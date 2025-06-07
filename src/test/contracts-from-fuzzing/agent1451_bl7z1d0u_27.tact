struct BoolDefault {
  flag: Bool = false;
}

contract DefaultBoolState {
  s: BoolDefault;

  init() {
    self.s = BoolDefault{};
  }
}
