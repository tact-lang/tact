struct L1 {
    x1: Int;
}

struct L2 {
    l1: L1;
}

struct L3 {
    l2: L2;
}

contract Test {
    deepNest: L3;

    init() {
        self.deepNest = L3{ l2: L2{ l1: L1{ x1: 42 } } };
    }
}
