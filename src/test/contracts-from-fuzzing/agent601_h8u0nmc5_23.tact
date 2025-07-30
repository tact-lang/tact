// Nested struct optional containing deeply nested struct
struct Leaf {
    val: Int as uint8;
}

struct Mid {
    leaf: Leaf;
}

struct TopOpt {
    mid: Mid?;
}

contract OptNestedInstall {
    storage: TopOpt;

    init() {
        self.storage = TopOpt {
            mid: null
        };
    }
}
