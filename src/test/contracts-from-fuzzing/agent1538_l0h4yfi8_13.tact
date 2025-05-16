struct X1 { a: Int; }
struct X2 { a: X1; }
struct X3 { a: X2; }
struct X4 { a: X3; }
struct X5 { a: X4; }
struct X6 { a: X5; }
struct X7 { a: X6; }
struct X8 { a: X7; }

contract Test {
  f: X8;

  init() {
    self.f = X8{
      a: X7{
        a: X6{
          a: X5{
            a: X4{
              a: X3{
                a: X2{
                  a: X1{a:123}
                }
              }
            }
          }
        }
      }
    };
  }
}