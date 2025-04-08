struct S1 {
  a: Int;
  b: Bool;
}

struct S2 {
  inner: S1;
  c: Bool;
}

struct S3 {
  nested: S2;
  d: Int;
}

contract DeepNestTest {
  data: S3;

  init() {
    self.data = S3{
      nested: S2{
        inner: S1{ a: 1, b: true },
        c: false
      },
      d: 42
    };
  }
}
