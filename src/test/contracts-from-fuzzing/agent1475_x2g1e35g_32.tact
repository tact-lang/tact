// Deeply nested with mixed defaults
struct L3 {
    x: Int = 7;
    y: Bool;
}

struct L2 {
    inner: L3;
    z: String?;
}

struct L1 {
    child: L2?;
}

contract MixDefaultsDeep {
    store: L1;

    init() {
        self.store = L1 {
            child: null,
        };
    }
}