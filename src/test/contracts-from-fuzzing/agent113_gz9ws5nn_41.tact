struct DefaultsNest {
  a: Int = 4;
  b: Bool = true;
}

contract DefaultsInContract {
  d: DefaultsNest;

  init() {
    self.d = DefaultsNest{};
  }
}