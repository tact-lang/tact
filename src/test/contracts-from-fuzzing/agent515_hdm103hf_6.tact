struct S1 {
  f1: Int;
  f2: Bool;
}

struct S2 {
  f3: Int;
  s1: S1;
}

struct S3 {
  f4: Bool;
  s2: S2;
}

struct S4 {
  f5: String;
  s3: S3;
}

struct S5 {
  f6: Int?;
  s4: S4;
}

contract DeepChain {
  val: S5;

  init() {
    self.val = S5{
      f6: null,
      s4: S4{
        f5: "deep",
        s3: S3{
          f4: true,
          s2: S2{
            f3: 7,
            s1: S1{f1: 2, f2: false}
          }
        }
      }
    };
  }
}
