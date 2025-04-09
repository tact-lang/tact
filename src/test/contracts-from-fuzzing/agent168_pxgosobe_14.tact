struct HasDefault {
  a: Int = 5;
  b: Bool = false;
  c: String = "default";
}

contract TestDefaults {
  f: HasDefault;

  init() {
    self.f = HasDefault{};
  }
}