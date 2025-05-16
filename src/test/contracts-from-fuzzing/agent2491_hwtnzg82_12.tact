struct HasDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "";
}

contract DefaultVals {
  val: HasDefaults;

  init() {
    self.val = HasDefaults{};
  }
}