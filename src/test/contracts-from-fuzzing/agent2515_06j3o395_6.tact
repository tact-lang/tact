struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
  s1: S1;
}

struct S3 {
  c: Bool;
  s2: S2;
}

contract NestedMixed {
  data: S3;

  init() {
    self.data = S3{
      c: true,
      s2: S2{
        b: 2,
        s1: S1{a: 1}
      }
    };
  }
}
