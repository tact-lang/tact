struct Complex {
  a: Int as uint32 = 100;
  b: Bool?;
  c: String = "hi";
  d: Int?;
}

contract ComplexMix {
  persist: Complex;

  init() {
    self.persist = Complex{
      b: true,
      d: null
    };
  }
}