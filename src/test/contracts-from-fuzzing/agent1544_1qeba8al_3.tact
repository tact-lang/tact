struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  s1: S1;
  c: Bool;
}

struct S3 {
  s2: S2;
  d: Bool;
}

contract DeepNest {
  val: S3;

  init() {
    self.val = S3{
      s2: S2{
        s1: S1{ a: 42, b: true },
        c: false
      },
      d: true
    };
  }
}
