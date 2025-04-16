struct DeeplyNested {
    l1: L1;
}

struct L1 { l2: L2; }
struct L2 { l3: L3; }
struct L3 { l4: L4; }
struct L4 { l5: L5; }
struct L5 { val: Int; }

contract VeryDeep {
    dn: DeeplyNested;
    init() {
        self.dn = DeeplyNested{
            l1: L1{
                l2: L2{
                    l3: L3{
                        l4: L4{
                            l5: L5{ val: 1234 }
                        }
                    }
                }
            }
        };
    }
}
