struct A1 { a: Int; }
struct A2 { a1: A1; }
struct A3 { a2: A2; }
struct A4 { a3: A3; }
struct A5 { a4: A4; }
struct A6 { a5: A5; }

contract DeepSixNest {
  s: A6;

  init() {
    self.s = A6{
      a5: A5{
        a4: A4{
          a3: A3{
            a2: A2{
              a1: A1{a: 10}
            }
          }
        }
      }
    };
  }
}