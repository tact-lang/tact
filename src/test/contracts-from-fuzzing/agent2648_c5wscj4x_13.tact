struct S0 { a: Int }
struct S1 { s0: S0; b: Int }
struct S2 { s1: S1; c: Int }
struct S3 { s2: S2; d: Int }
struct S4 { s3: S3; e: Int }

contract DeepFive {
  field: S4;

  init() {
    self.field = S4{
      s3: S3{
        s2: S2{
          s1: S1{
            s0: S0{ a:1 },
            b:2
          },
          c:3
        },
        d:4
      },
      e:5
    };
  }
}
