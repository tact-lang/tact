struct L1 { a: Int; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }

contract Deep4Levels {
    deep: L4;
    init() {
        self.deep = L4{ l3: L3{ l2: L2{ l1: L1{ a: 42 } } } };
    }
}