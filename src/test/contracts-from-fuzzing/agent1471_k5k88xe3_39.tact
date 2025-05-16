struct HasEmptyStringDefault {
  a: String = "";
}

contract EmptyStrDefault {
  s: HasEmptyStringDefault;

  init() {
    self.s = HasEmptyStringDefault{};
  }
}
