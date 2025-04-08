struct OptionDefault {
  opt: Int? = null;
}

contract OptionalDefaultField {
  data: OptionDefault;

  init() {
    self.data = OptionDefault{};
  }
}