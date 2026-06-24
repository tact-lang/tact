struct S1 { a: Int; }
struct S2 { x: S1; }
struct S3 { y: S2; }

contract InitChain {
  f: S3;
  init() {
    self.f = S3{ y: S2{ x: S1{ a:5 }}};
  }
}