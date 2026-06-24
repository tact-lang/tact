struct L1 { i: Int }
struct L2 { l1: L1? }
struct L3 { l2: L2? }
struct L4 { l3: L3? }
struct L5 { l4: L4? }

contract Test {
    data: L5;

    init() {
        self.data = L5 {
            l4: L4 {
                l3: L3 {
                    l2: L2 {
                        l1: L1 { i:10 }
                    }
                }
            }
        };
    }
}
