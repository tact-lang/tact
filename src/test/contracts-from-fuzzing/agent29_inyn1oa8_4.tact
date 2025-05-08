struct L1 { field: Int; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }
struct L5 { l4: L4; }
struct L6 { l5: L5; }
struct L7 { l6: L6; }

contract TestDeep {
    receive() {
       let deep: L7 = L7 {
           l6: L6 {
               l5: L5 {
                   l4: L4 {
                       l3: L3 {
                           l2: L2 {
                               l1: L1 {
                                   field: 42
                               }
                           }
                       }
                   }
               }
           }
       };
       let x = deep.l6.l5.l4.l3.l2.l1.field;
       // Dump x to suppress unused warnings
       dump(x);
    }
}
