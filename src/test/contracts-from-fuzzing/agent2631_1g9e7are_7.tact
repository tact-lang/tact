// test nested named structs instead
struct L3 { n1: Int; n2: Bool; }
struct L2 { m1: Int; m2: L3; }
struct L1 { l1: Int; l2: L2; }

contract DeepNamedNesting {
    store: L1;

    init() {
        self.store = L1{
            l1: 1,
            l2: L2{
                m1: 2,
                m2: L3{ n1: 3, n2: false }
            }
        };
    }
}