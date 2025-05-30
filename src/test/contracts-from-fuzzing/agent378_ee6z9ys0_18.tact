struct S1 {
  i: Int;
  b: Bool;
}

struct S2 {
  s: S1;
}

struct S3 {
  s: S2;
}

contract TestContract {
  nested: S3;

  init() {
    self.nested = S3{ s: S2{ s: S1{ i: 7, b: true } } };
  }
}