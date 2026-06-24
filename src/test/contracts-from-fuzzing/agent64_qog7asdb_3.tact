struct L1 { v: Int; }
struct L2 { n: L1; }
struct L3 { n: L2; }
struct L4 { n: L3; }
struct L5 { n: L4; }

contract TestDeep {
    receive() {
         let chain: L5 = L5 {
             n: L4 {
                 n: L3 {
                     n: L2 {
                         n: L1 { v: 12345 }
                     }
                 }
             }
         };
         let res: Int = chain.n.n.n.n.v;
         dump(res);
    }
}
