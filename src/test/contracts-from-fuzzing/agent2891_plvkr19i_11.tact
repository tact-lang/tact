struct S1 {
  a: Int;
}
struct S2 {
  b: String?;
}
struct S3 {
  c: Int;
}
struct Level {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract MultiStructs {
  lvl: Level;

  init() {
    self.lvl = Level{
      s1: S1{a:1},
      s2: S2{b:null},
      s3: S3{c:2}
    };
  }
}