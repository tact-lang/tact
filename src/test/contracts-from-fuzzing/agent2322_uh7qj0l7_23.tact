struct DefaultOpt {
  a: Int? = 10;
  b: Int? = null;
}

contract WeirdOptionalDefaults {
  d: DefaultOpt;
  init() {
    self.d = DefaultOpt{};
  }
}
