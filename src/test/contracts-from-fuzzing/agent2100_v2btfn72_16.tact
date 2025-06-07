struct L1 {
    f1: Int;
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

contract Test {
    nested: L4;
    init() {
        self.nested = L4{l3: L3{l2: L2{l1: L1{f1:42}}}};
    }
}