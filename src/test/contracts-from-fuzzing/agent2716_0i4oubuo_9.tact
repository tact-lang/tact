struct S1 { a: Int; }
struct S2 { s1: S1; b: Int; }
struct S3 { s2: S2; c: Int; }
struct S4 { s3: S3; d: Int; }
struct S5 { s4: S4; e: Int; }
struct S6 { s5: S5; f: Int; }
contract DeepChain {
  data: S6;
  init() {
    self.data = S6{
      s5: S5{
        s4: S4{
          s3: S3{
            s2: S2{
              s1: S1{a:1}, b:2
            },
            c:3
          },
          d:4
        },
        e:5
      },
      f:6
    };
  }
}