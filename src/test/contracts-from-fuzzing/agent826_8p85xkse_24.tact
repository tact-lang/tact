struct L1 { v: Int; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }
struct L5 { l4: L4; }

contract TestContract {
    deep: L5 = L5{ l4: L4{ l3: L3{ l2: L2{ l1: L1{ v: 9 } } } } };

    init() {
        self.deep = L5{ l4: L4{ l3: L3{ l2: L2{ l1: L1{ v: 99 } } } } };
    }
}
