struct L5 {
    v: Int;
}

struct L4 {
    v: Int;
    l5: L5;
}

struct L3 {
    v: Int;
    l4: L4;
}

struct L2 {
    v: Int;
    l3: L3;
}

struct L1 {
    v: Int;
    l2: L2;
}

contract DeepChainTest {
    receive() {
        let d = L1 {
            v: 1,
            l2: L2 {
                v: 2,
                l3: L3 {
                    v: 3,
                    l4: L4 {
                        v: 4,
                        l5: L5 { v: 5 }
                    }
                }
            }
        };
        let total = d.v + d.l2.v + d.l2.l3.v + d.l2.l3.l4.v + d.l2.l3.l4.l5.v;
    }
}
