struct S1 {
  x: Int = 1;
}

struct S2 {
  s1: S1;
}

struct S3 {
  s2: S2;
}

struct S4 {
  s3: S3;
}

contract DeepNestContract {
  s4: S4;

  init() {
    self.s4 = S4{
      s3: S3{
        s2: S2{
          s1: S1{ x: 99 }
        }
      }
    };
  }
}