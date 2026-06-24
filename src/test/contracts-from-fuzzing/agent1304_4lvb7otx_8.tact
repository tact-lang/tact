struct Inner { foo: Int; }

struct ComplexOpt {
  n: Int?;
  b: Bool?;
  s: String?;
  innerOpt: Inner?;
}

contract MixOpt {
  val: ComplexOpt;

  init() {
    self.val = ComplexOpt{ n:null, b:null, s:null, innerOpt:null };
  }
}