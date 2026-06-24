// Contract with a very deeply nested struct
struct N1 { a: Int; }
struct N2 { n1: N1; }
struct N3 { n2: N2; }
struct N4 { n3: N3; }
struct N5 { n4: N4; }
struct N6 { n5: N5; }
struct N7 { n6: N6; }
struct N8 { n7: N7; }
struct N9 { n8: N8; }
struct N10 { n9: N9; }

contract DeepTenNest {
  root: N10;

  init() {
    self.root = N10{
      n9: N9{
        n8: N8{
          n7: N7{
            n6: N6{
              n5: N5{
                n4: N4{
                  n3: N3{
                    n2: N2{
                      n1: N1{
                        a: 777
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    };
  }
}