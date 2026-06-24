// very deeply nested structs with mixed optionals
struct L5 { val: Int? }
struct L4 { next: L5 }
struct L3 { opt: L4? }
struct L2 { next: L3 }
struct L1 { opt: L2? }

contract DeepTree {
    node: L1;
    init() {
        self.node = L1 {
            opt: L2 {
                next: L3 {
                    opt: null
                }
            }
        };
    }
}
