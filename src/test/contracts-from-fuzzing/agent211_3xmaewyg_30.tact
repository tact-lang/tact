struct HasOptionalDefault {
  opt: Int? = null;
}

contract OptionalDefaultValTest {
  s: HasOptionalDefault;

  init() {
    self.s = HasOptionalDefault{};
  }
}
