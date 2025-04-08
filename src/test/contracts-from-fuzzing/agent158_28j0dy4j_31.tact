struct InlineDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Bool = true;
  d: Bool?;
}

contract DefaultsStructVar {
  s: InlineDefaults;

  init() {
    self.s = InlineDefaults{
      d: false
    };
  }
}