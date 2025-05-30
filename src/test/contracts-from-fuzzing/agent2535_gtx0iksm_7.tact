struct S {
  x: Int;
}

struct Outer {
  s1: S;
  s2: S;
  s3: S;
  s4: S;
  s5: S;
}

contract RepeatedStructs {
  data: Outer;

  init() {
    self.data = Outer{
      s1: S{ x:1 },
      s2: S{ x:2 },
      s3: S{ x:3 },
      s4: S{ x:4 },
      s5: S{ x:5 },
    };
  }
}