struct IntsOptional {
  a: Int?;
  b: Int;
  c: Int?;
}

contract OptCombo {
  f: IntsOptional;

  init() {
    self.f = IntsOptional{a: null, b: 2, c: null};
  }
}