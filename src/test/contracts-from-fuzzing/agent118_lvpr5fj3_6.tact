struct S1 {
  a: Int;
}

struct S2 {
  s1field: S1;
}

struct S3 {
  s2field: S2;
}

struct S4 {
  s3field: S3;
}

struct S5 {
  s4field: S4;
}

contract DepthFive {
  data: S5;

  init() {
    self.data = S5{
      s4field: S4{
        s3field: S3{
          s2field: S2{
            s1field: S1{a: 42}
          }
        }
      }
    };
  }
}