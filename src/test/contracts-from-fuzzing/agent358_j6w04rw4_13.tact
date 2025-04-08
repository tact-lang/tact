struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  s1: S1;
}

struct S3 {
  s2: S2;
}

contract DeepDeep {
  val: S3;

  init() {
    self.val = S3{
      s2: S2{
        s1: S1{ a: 123, b: false }
      }
    };
  }
}