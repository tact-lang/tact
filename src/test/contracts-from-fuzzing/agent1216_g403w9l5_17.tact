struct Complex {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
  e: Bool;
  f: Bool?;
  s1: String;
  s2: String?;
}

contract ComplexDataTest {
  c: Complex;

  init() {
    self.c = Complex{
      a: 1,
      b: null,
      c: 2,
      d: 3,
      e: false,
      f: null,
      s1: "hello",
      s2: null
    };
  }
}