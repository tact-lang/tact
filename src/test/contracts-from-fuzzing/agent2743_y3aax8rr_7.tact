struct S1 {
  f1: Int;
}

struct S2 {
  f2: Int;
  nested: S1;
}

struct S3 {
  nested: S2;
}

contract CrossNested {
  s3: S3;

  init() {
    self.s3 = S3{
      nested: S2{
        f2: 2,
        nested: S1{ f1: 1 },
      }
    };
  }
}