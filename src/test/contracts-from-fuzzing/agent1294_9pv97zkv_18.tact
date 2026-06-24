struct L4 { val: Int; }
struct L3 { nest: L4; }
struct L2 { nest: L3; }
struct L1 { nest: L2; }

contract ExtremeNest {
    storage: L1 = L1{
        nest: L2{
            nest: L3{
                nest: L4{ val: 999 }
            }
        }
    };
    receive() {}
}