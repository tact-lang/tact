struct OptionLayer {
  foo: Int?;
  bar: String?;
}

contract DefaultOpt {
  nested: OptionLayer? = null;

  init() {
    self.nested = OptionLayer{ foo: null, bar: null };
  }
}