struct EmptyStringDefault {
  a: String = "";
}

contract EmptyStringDefaultContract {
  s: EmptyStringDefault;

  init() {
    self.s = EmptyStringDefault{};
  }
}
