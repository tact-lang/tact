struct S1 { a: Int; }

struct S2 { a: Int; s: S1; }

struct S3 { a: Int; s: S2; }

struct S4 { a: Int; s: S3; }

contract CascadingNested {
  field: S4;

  init() {
    self.field = S4 {
      a:1,
      s: S3 {
        a:2,
        s: S2 {
          a:3,
          s: S1{
            a:4
          }
        }
      }
    };
  }
}