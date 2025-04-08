struct Complex {
  s1: String;
  s2: String?;
  b1: Bool;
  b2: Bool?;
  i1: Int;
  i2: Int?;
}

contract ComplexStore {
  d: Complex;

  init() {
    self.d = Complex{
      s1: "x",
      s2: null,
      b1: true,
      b2: false,
      i1: 42,
      i2: null
    };
  }
}