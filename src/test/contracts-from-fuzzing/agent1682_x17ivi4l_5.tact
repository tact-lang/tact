struct S1 { x: Int; y: Bool }
struct S2 { a: Int; b: S1 }
struct S3 { c: Bool; d: S2 }

contract TestContract {
  s3: S3;

  init() {
    self.s3 = S3{
      c: true,
      d: S2{
        a: 11,
        b: S1{ x: 22, y: false }
      }
    };
  }
}