struct L3 { val: Int; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract Wrapper {
    core: L1;

    init() {
        self.core = L1{ l2: L2{ l3: L3{ val:69 } } };
    }
}