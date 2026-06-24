struct SNested {
  inner: Int;
  opt: Bool?;
}

contract OptionalNestedDefaults {
  s: SNested;

  init() {
    self.s = SNested{
      inner: 77,
      opt: null
    };
  }
}