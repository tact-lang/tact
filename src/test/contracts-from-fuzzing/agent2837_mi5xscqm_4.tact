struct Defaults {
  a: Int = 5;
  b: Bool = false;
  c: String = "hello";
}

contract TestDefaults {
  def: Defaults;
  init() {
    self.def = Defaults{};
  }
}