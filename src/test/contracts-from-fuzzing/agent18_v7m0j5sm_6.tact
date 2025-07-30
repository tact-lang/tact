struct S1 { a: Int; }
struct S2 { a: Int; b: S1; }
struct S3 { a: Int; b: S2; }
struct S4 { a: Int; b: S3; }
struct S5 { a: Int; b: S4; }

contract WiderDeeper {
  s: S5;

  init() {
    self.s = S5{
      a: 5,
      b: S4{
        a: 4,
        b: S3{ a:3, b: S2{ a:2, b: S1{ a:1 } } }
      }
    };
  }
}