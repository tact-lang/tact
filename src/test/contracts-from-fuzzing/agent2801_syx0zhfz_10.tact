struct DefaultOpt {
  a: Int? = null;
  b: String? = null;
}

contract WithDefaults {
  val: DefaultOpt;

  init() {
    self.val = DefaultOpt{};
  }
}