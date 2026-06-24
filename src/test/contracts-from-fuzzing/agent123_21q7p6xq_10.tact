struct L1 { x: Int; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }
struct L5 { l4: L4; }

contract TestContract {
    nested: L5;

    init() {
        self.nested = L5{ l4: L4{ l3: L3{ l2: L2{ l1: L1{ x: 77 } } } } };
    }
}