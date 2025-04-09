struct S1 { a: Int }
struct S2 { a: Int }
struct S3 { a: Int }
struct S4 { a: Int }

struct BigStruct {
  s1: S1;
  s2: S2;
  s3: S3;
  s4: S4;
}

contract BigStorage {
  field: BigStruct;

  init() {
    self.field = BigStruct{
      s1: S1{a:1},
      s2: S2{a:2},
      s3: S3{a:3},
      s4: S4{a:4}
    };
  }
}