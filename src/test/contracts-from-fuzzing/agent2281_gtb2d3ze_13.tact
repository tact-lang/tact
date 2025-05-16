struct Complex {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
}

contract ComplexInit {
  val: Complex;

  init() {
    self.val = Complex{
      a:1,
      b:null,
      c:true,
      d:null,
      e:"hi",
      f:null
    };
  }
}