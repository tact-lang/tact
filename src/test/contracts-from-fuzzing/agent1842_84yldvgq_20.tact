struct L1 {
    i: Int;
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

contract MidDeepNest {
    root: L4;

    init() {
        self.root = L4{ l3: L3{ l2: L2{ l1: L1{ i: -42 }}}};
    }
}