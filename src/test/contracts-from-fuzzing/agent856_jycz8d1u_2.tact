struct S1 {
  x: Int;
  y: Bool;
}

struct S2 {
  s1_a: S1;
  s1_b: S1;
  flag: Bool;
}

struct S3 {
  s2_a: S2;
  s2_b: S2;
  s2_c: S2;
}

contract DeepNestedStructStorage {
  data: S3;

  init() {
    self.data = S3{
      s2_a: S2{
        s1_a: S1{ x:1, y:true },
        s1_b: S1{ x:2, y:false },
        flag: true
      },
      s2_b: S2{
        s1_a: S1{ x:3, y:true },
        s1_b: S1{ x:4, y:false },
        flag: false
      },
      s2_c: S2{
        s1_a: S1{ x:5, y:true },
        s1_b: S1{ x:6, y:false },
        flag: true
      }
    };
  }
}