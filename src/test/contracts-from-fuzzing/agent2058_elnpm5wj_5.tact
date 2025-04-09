struct L1 { l2: L2 }
struct L2 { l3: L3 }
struct L3 { l4: L4 }
struct L4 { l5: L5 }
struct L5 { val: Int }

contract Test {
    nested: L1;

    init() {
        self.nested = L1{ l2: L2{ l3: L3{ l4: L4{ l5: L5{ val: 42 }}}}};
    }
}