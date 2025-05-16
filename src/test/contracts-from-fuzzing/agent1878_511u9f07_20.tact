struct L7 { done: Bool?; }
struct L6 { l7: L7; }
struct L5 { l6: L6; }
struct L4 { l5: L5; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract Test {
    data: L1;

    init() {
        self.data = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        l5: L5{
                            l6: L6{
                                l7: L7{ done: null }
                            }
                        }
                    }
                }
            }
        };
    }
}