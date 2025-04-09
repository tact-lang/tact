struct L4 { x: Int; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract DeepNested {
    field: L1;

    init() {
        self.field = L1{ l2: L2{ l3: L3{ l4: L4{ x: 99 } } } };
    }
}