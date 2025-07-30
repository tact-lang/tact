struct Defaults {
  n: Int = 42;
  b: Bool = false;
  s: String = "default";
}

contract WithDefaults {
  val: Defaults;

  init() {
    self.val = Defaults{};
  }
}
