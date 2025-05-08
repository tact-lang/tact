struct L4 {
    value: Int;
}

struct L3 {
    l4: L4;
}

struct L2 {
    l3: L3;
}

struct L1 {
    l2: L2;
}

contract Test {
    data: L1;

    init() {
        self.data = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        value: 777
                    }
                }
            }
        };
    }
}
