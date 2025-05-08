struct DefaultsOpt {
  val: Int? = null;
  flag: Bool = false;
  txt: String = "";
}

contract OptDefaults {
  s: DefaultsOpt;
  init() {
    self.s = DefaultsOpt{};
  }
}