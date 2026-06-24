struct Sample {
  a: Int;
  b: Int?;
}

contract OptionalMixed {
  s: Sample;
  init() {
    self.s = Sample{ a: 1, b: null };
  }
}