struct L5 { x: Int }
struct L4 { l5: L5 }
struct L3 { l4: L4 }
struct L2 { l3: L3 }
struct L1 { l2: L2 }

contract DeepNest {
    node: L1;

    init() {
        self.node = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        l5: L5{
                            x: 42
                        }
                    }
                }
            }
        };
    }
}

contract U { receive() {} }