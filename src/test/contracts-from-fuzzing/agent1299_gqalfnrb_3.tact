struct L1 {
    x: Int;
}

struct L2 {
    l1: L1;
}

struct L3 {
    l2: L2;
}

struct L4 {
    l3: L3;
}

contract Chain {
    deep: L4;

    init() {
        self.deep = L4{
            l3: L3{
                l2: L2{
                    l1: L1{ x: 42 }
                }
            }
        };
    }
}