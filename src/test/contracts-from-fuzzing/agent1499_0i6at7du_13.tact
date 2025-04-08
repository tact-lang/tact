struct Complex {
  a: Int as uint32;
  b: Int?;
  c: Bool?;
  d: Int = 10;
  e: String?;
}

contract ComplexStorage {
  val: Complex;
  init() {
    self.val = Complex{
      a: 123,
      b: null,
      c: true,
      d: 42,
      e: null
    };
  }
  receive() {}
}