struct ManyDefaults {
  a: Int = 0;
  b: Bool = false;
  s: String = "";
  addr: Address? = null;
}

contract DefContract {
  f: ManyDefaults;

  init() {
    self.f = ManyDefaults{};
  }
}
