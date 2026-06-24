struct S1 {
  x: Int;
}

struct S2 {
  a: S1;
  b: Int;
}

struct S3 {
  s2: S2;
  c: Int;
}

struct S4 {
  s3: S3;
  d: Int;
}

contract DeepNest {
  state: S4;

  init() {
    self.state = S4{
      s3: S3{
        s2: S2{
          a: S1{ x: 1 },
          b: 2
        },
        c:3
      },
      d:4
    };
  }
}