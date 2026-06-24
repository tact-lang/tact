struct MixedOpts {
  a: Int?;
  b: Address?;
  c: Bool?;
}

contract MixedVals {
  stuff: MixedOpts;

  init() {
    self.stuff = MixedOpts{
      a: 42,
      b: null,
      c: true
    };
  }
}