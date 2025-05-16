struct L4 { v: Int; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract TestContract {
    nested: L1;

    init() {
        self.nested = L1{
            l2: L2{
                l3: L3{
                    l4: L4{v: 777}
                }
            }
        };
    }
}