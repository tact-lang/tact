struct DeeplyNested {
  s1: S1;
}

struct S1 {
  s2: S2;
  flag1: Bool;
}

struct S2 {
  s3: S3;
  flag2: Bool;
}

struct S3 {
  s4: S4;
  flag3: Bool;
}

struct S4 {
  num: Int;
  flag4: Bool;
}

contract TestContract {
  data: DeeplyNested;
  init() {
    self.data = DeeplyNested{
      s1: S1{
        s2: S2{
          s3: S3{
            s4: S4{num: 42, flag4: true},
            flag3: false
          },
          flag2: true
        },
        flag1: false
      }
    };
  }
}