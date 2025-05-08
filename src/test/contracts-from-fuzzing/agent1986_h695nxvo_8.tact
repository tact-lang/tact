struct S9 { x: Int; }

struct S8 { s9: S9; }
struct S7 { s8: S8; }
struct S6 { s7: S7; }
struct S5 { s6: S6; }
struct S4 { s5: S5; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepChain {
  root: S1 = S1{
    s2: S2{
      s3: S3{
        s4: S4{
          s5: S5{
            s6: S6{
              s7: S7{
                s8: S8{
                  s9: S9{ x: 5 }
                }
              }
            }
          }
        }
      }
    }
  };

  init() {
    self.root.s2.s3.s4.s5.s6.s7.s8.s9.x = 100;
  }
}
