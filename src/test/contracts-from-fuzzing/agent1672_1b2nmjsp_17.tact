// deeply nested multi-layer optional structure
struct L1 { a: Int?; }
struct L2 { l1: L1?; }
struct L3 { l2: L2?; }

contract TestContract {
    nested: L3;
    init() {
        self.nested = L3 {
            l2: L2 {
                l1: L1 {
                    a: null
                }
            }
        };
    }
}