struct L4 {
    deepVal: Int;
}

struct L3 {
    l4: L4?;
}

struct L2 {
    l3: L3?;
}

struct L1 {
    l2: L2?;
}

contract DeepOptionalPath {
    data: L1?;

    init() {
        self.data = null;
    }
}