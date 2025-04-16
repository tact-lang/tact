struct DeepOptional {
  x: Int?;
  y: String?;
  z: Bool?;
}

struct MidOptional {
  d1: DeepOptional;
  d2: DeepOptional;
}

contract ComplexOptionals {
  opt: MidOptional;

  init() {
    self.opt = MidOptional{
      d1: DeepOptional{ x: null, y: null, z: true },
      d2: DeepOptional{ x: 5, y: "hi", z: null }
    };
  }
}