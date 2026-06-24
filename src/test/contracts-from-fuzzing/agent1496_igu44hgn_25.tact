struct L1 { x: Int; }
struct L2 { l1a: L1; l1b: L1; }
struct L3 { l2a: L2; l2b: L2; }
struct L4 { l3a: L3; l3b: L3; }

contract TestContract {
    big: L4;
    init() {
        self.big = L4{
            l3a: L3{
                l2a: L2{
                    l1a:L1{x:1}, l1b:L1{x:2}
                },
                l2b: L2{
                    l1a:L1{x:3}, l1b:L1{x:4}
                }
            },
            l3b: L3{
                l2a: L2{
                    l1a:L1{x:5}, l1b:L1{x:6}
                },
                l2b: L2{
                    l1a:L1{x:7}, l1b:L1{x:8}
                }
            }
        };
    }
}