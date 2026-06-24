struct L1 { a: Int }
struct L2 { l1: L1 }
struct L3 { l2: L2 }
struct L4 { l3: L3 }
struct L5 { l4: L4 }
struct L6 { l5: L5 }

contract DeepLayers {
    deep: L6 = L6{
        l5: L5{
            l4: L4{
                l3: L3{
                    l2: L2{
                        l1: L1{ a: 123 }
                    }
                }
            }
        }
    };

    init() {
        self.deep = L6{
            l5: L5{
                l4: L4{
                    l3: L3{
                        l2: L2{
                            l1: L1{ a: 456 }
                        }
                    }
                }
            }
        };
    }
}