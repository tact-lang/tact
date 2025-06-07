struct InnerOptionalDefault {
  val: Int? = null;
}

contract OptionalDefaults {
  f: InnerOptionalDefault;

  init() {
    self.f = InnerOptionalDefault{};
  }
}
