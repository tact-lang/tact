struct DeepNest {
    lvl1: L1;
}

struct L1 {
    lvl2: L2;
}

struct L2 {
    lvl3: L3;
}

struct L3 {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: DeepNest;
    init() {
        self.data = DeepNest{ lvl1: L1{ lvl2: L2{ lvl3: L3{ x: 42, y: true } } } };
    }
}
