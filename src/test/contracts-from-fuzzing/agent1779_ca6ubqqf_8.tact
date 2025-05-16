struct L1 {
    a: Int;
}

struct L2 {
    l1a: L1;
    l1b: L1;
}

struct L3 {
    l2: L2;
}

contract RepeatNested {
    root: L3;
    init() {
        self.root = L3{l2: L2{l1a: L1{a: 1}, l1b: L1{a: 2}}};
    }
}