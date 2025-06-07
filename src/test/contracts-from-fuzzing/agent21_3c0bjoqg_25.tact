struct L3 {
    z: Int = 7;
}

struct L2 {
    y: Int? = null;
    other: L3? = L3{};
}

struct L1 {
    x: Int? = null;
    nested: L2? = L2{};
}

contract TestContract {
    deepOpt: L1 = L1{};

    init() {
        self.deepOpt = L1{};
    }
}