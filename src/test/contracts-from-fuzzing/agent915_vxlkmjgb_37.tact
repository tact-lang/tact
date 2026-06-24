struct S1 {
  a: Int?;
  b: Int?;
}

struct S2 {
  s: S1;
  c: Int = 3;
}

contract DefaultsCascadeOpt {
  val: S2;

  init() {
    self.val = S2{
      s: S1{ a: null, b: null }
    };
  }
}
