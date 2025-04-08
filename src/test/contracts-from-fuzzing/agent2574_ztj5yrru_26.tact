struct InnerMost {
  aa: Int?;
  bb: Bool?;
}

struct InnerLevel {
  im: InnerMost;
}

struct OuterMost {
  il: InnerLevel;
}

contract OptionDeepNest {
  optNested: OuterMost;

  init() {
    self.optNested = OuterMost{
      il: InnerLevel{
        im: InnerMost{ aa: null, bb: false }
      }
    };
  }
}