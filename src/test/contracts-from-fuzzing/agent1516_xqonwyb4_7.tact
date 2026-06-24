struct S1 {
  x: Int;
}

struct S2 {
  s1: S1;
  y: Bool;
}

struct S3 {
  s2: S2;
  s1_2: S1;
}

contract MultipleNested {
  data: S3;

  init() {
    self.data = S3{
      s2: S2{
        s1: S1{ x: 77 },
        y: true
      },
      s1_2: S1{ x: 88 }
    };
  }
}