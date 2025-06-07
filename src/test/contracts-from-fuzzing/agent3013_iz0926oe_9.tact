// very deep nested chain
struct L4 { value: Int; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract DeepChain {
    l1: L1;

    init() {
        self.l1 = L1{ l2: L2{ l3: L3{ l4: L4{ value: 777 } } } };
    }
}
