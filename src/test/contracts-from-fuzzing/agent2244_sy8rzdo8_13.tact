struct S1 {
  f1: Int;
  f2: Bool;
}

struct S2 {
  f1: S1;
  f2: S1;
}

struct S3 {
  f1: S2;
  f2: S2;
}

contract DoubleNested {
  data: S3;

  init() {
    self.data = S3{
      f1: S2{
        f1: S1{f1:1,f2:true},
        f2: S1{f1:2,f2:false}
      },
      f2: S2{
        f1: S1{f1:3,f2:true},
        f2: S1{f1:4,f2:false}
      }
    };
  }
}
