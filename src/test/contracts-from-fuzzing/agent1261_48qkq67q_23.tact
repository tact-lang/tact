struct DeepOptional {
  d1: Int?;
  d2: String?;
}

struct OuterLayer {
  o1: DeepOptional;
  o2: DeepOptional;
}

contract LayeredOptionals {
  opt: OuterLayer;

  init() {
    self.opt = OuterLayer{
      o1: DeepOptional{ d1: null, d2: null },
      o2: DeepOptional{ d1: 3, d2: "Hello" }
    };
  }
}