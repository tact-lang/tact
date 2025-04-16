struct S1 { x: Int; }

struct S2 {
  a: S1;
  b: S1?;
}

struct S3 {
  s: S2;
}

contract TestContract {
  data: S3;

  init() {
    self.data = S3 {
      s: S2 {
        a: S1 { x: 10 },
        b: null
      }
    };
  }
}