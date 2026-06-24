struct Complex {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
}

contract ComplexStorage {
  val: Complex;

  init() {
    self.val = Complex{
      a: 5,
      b: null,
      c: true,
      d: false,
      e: "abc",
      f: null,
    };
  }
}
