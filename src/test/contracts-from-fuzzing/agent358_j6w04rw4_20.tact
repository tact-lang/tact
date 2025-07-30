struct S1 {
  a: Int;
}

struct S2 {
  a: Int;
}

struct S3 {
  s1: S1;
  s2: S2;
}

struct MainStruct {
  s3: S3;
  b: Bool;
  optStr: String?;
  optInt: Int?;
}

contract StructPersist {
  val: MainStruct;
  init() {
    self.val = MainStruct{
      s3: S3{
        s1: S1{ a: 1 },
        s2: S2{ a: 2 }
      },
      b: true,
      optStr: null,
      optInt: null
    };
  }
}