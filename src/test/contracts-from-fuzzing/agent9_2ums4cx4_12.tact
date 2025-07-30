struct S1 {
  a: Int;
}
struct S2 {
  b: S1;
}
struct S3 {
  c: S2;
}
contract ChainNest {
  s: S3;

  init() {
    self.s = S3{ c: S2{ b: S1{ a: 5 } } };
  }
}
