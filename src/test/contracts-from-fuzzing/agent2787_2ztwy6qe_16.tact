struct L1 { f: Int }
struct L2 { l1: L1 }
struct L3 { l2: L2 }
struct L4 { l3: L3 }
struct L5 { l4: L4 }

contract DeepNest {
    f: L5;
    init() {
        self.f = L5{ l4: L4{ l3: L3{ l2: L2{ l1: L1{ f: 7 }}}}};
    }
}
