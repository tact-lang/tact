struct S1 {
  a: Int;
}
struct S2 {
  b: Bool;
}
struct S3 {
  c: String;
}

contract StructMix {
  s1: S1;
  s2: S2;
  s3: S3;

  init() {
    self.s1 = S1{ a: 4 };
    self.s2 = S2{ b: true };
    self.s3 = S3{ c: "hi" };
  }
}