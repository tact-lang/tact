struct S1 {
  i: Int;
  s: String;
}

struct S2 {
  x: Int;
  inner: S1;
}

struct S3 {
  y: Int?;
  nested: S2;
}

contract HighlyNested {
  deepField: S3;

  init() {
    self.deepField = S3{
      y: null,
      nested: S2{
        x: 1,
        inner: S1{ i: 2, s: "hi" }
      }
    };
  }
}