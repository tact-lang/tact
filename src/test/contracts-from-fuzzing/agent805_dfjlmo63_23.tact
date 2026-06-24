struct S1 { a: Int; }
struct S2 { b: Int; c: S1; }
struct S3 { d: Int; e: S2; }

contract NestedStructTest {
  f: S3;

  init() {
    self.f = S3{
      d: 2,
      e: S2{
        b: 3,
        c: S1{ a: 4 }
      }
    };
  }
}
