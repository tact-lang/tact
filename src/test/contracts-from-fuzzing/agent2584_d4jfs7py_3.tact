struct NestedDeep {
    l1: L1;
}

struct L1 {
    l2: L2;
}

struct L2 {
    l3: L3;
}

struct L3 {
    l4: L4;
}

struct L4 {
    v: Int;
}

contract NestedTest {
    data: NestedDeep;

    init() {
        self.data = NestedDeep {
            l1: L1 {
                l2: L2 {
                    l3: L3 {
                        l4: L4 {
                            v: 123
                        }
                    }
                }
            }
        };
    }
}
