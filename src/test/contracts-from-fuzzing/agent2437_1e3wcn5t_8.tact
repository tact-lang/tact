struct S1 {
  a: Int?;
  b: String?;
}

struct S2 {
  c: S1?;
  d: Int;
}

struct S3 {
  e: S2?;
  f: Bool;
}

contract OptionalNested {
  data: S3;

  init() {
    self.data = S3{
      e: S2{
        c: S1{
          a: 1,
          b: "hi",
        },
        d: 2,
      },
      f: false,
    };
  }
}