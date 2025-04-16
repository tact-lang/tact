struct L10 { a: Int; }
struct L9 { a: Int; next: L10; }
struct L8 { a: Int; next: L9; }
struct L7 { a: Int; next: L8; }
struct L6 { a: Int; next: L7; }
struct L5 { a: Int; next: L6; }
struct L4 { a: Int; next: L5; }
struct L3 { a: Int; next: L4; }
struct L2 { a: Int; next: L3; }
struct L1 { a: Int; next: L2; }

contract TestDeepNested {
   receive() {
      let data: L1 = L1 {
         a: 1, 
         next: L2 {
            a: 2,
            next: L3 {
               a: 3,
               next: L4 {
                  a: 4,
                  next: L5 {
                     a: 5,
                     next: L6 {
                        a: 6,
                        next: L7 {
                           a: 7,
                           next: L8 {
                              a: 8,
                              next: L9 {
                                 a: 9,
                                 next: L10 { a: 10 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      };
      return;
   }
}
