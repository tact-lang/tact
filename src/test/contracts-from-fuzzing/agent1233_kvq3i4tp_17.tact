struct L3 {
    v: Int?;
}

struct L2 {
    n: L3?;
}

struct L1 {
    n: L2?;
}

contract OptionalLayers {
    root: L1;

    init() {
        self.root = L1{ n: null };
    }
}