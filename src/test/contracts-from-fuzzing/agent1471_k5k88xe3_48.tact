struct MixedDef {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
}

contract PartialDefaults {
  s: MixedDef;

  init() {
    self.s = MixedDef{
      a: 11,
      c: 33
    };
  }
}