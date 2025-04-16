// very deep nested struct chain, many layers
struct L1 { a: Int; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }
struct L5 { l4: L4; }
struct L6 { l5: L5; }

contract DeepSix {
    val: L6;

    init() {
        self.val = L6 {
            l5: L5 {
                l4: L4 {
                    l3: L3 {
                        l2: L2 {
                            l1: L1 {
                                a: 42
                            }
                        }
                    }
                }
            }
        };
    }
}
