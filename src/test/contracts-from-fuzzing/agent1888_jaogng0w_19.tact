struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  s1A: S1;
  s1B: S1;
  x: Int;
}

struct S3 {
  s2A: S2;
  s2B: S2;
  flag: Bool;
}

contract TreeStruct {
  root: S3;

  init() {
    self.root = S3{
      s2A: S2{ s1A:S1{a:1,b:true}, s1B:S1{a:2,b:false}, x:11},
      s2B: S2{ s1A:S1{a:3,b:true}, s1B:S1{a:4,b:false}, x:22},
      flag: true
    };
  }
}
