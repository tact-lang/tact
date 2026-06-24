struct OneOption {
  foo: Int?;
}

contract UninitOptionalStructField {
  s: OneOption;

  init() {
    self.s = OneOption{ foo: null };
  }
}