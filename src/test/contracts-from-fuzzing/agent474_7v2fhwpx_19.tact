struct S1 {
  a: Int;
}

struct S2 {
  s: S1;
  b: Int;
}

struct S3 {
  c: Int;
  s2: S2;
}

contract Test {
  deeply: S3;

  init() {
    self.deeply = S3{
      c: 1,
      s2: S2{ s: S1{a: 2 }, b:3 }
    };
  }
}
