// extremely deeply nested optional struct chain 6 levels
struct L6 { v: Int; }
struct L5 { l6: L6?; }
struct L4 { l5: L5?; }
struct L3 { l4: L4?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract OptionalSixLevels {
    chain: L1;

    init() {
        self.chain = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        l5: L5{
                            l6: L6{
                                v: 123
                            }
                        }
                    }
                }
            }
        };
    }
}