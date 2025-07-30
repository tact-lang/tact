struct IntDefault {
  num: Int = 100;
}

contract DefaultIntState {
  s: IntDefault;

  init() {
    self.s = IntDefault{};
  }
}
