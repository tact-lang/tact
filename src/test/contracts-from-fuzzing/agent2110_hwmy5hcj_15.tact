// Optional struct with nested optional field initialized deeply null
struct Leaf {
    v: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract DeepOpt {
    storage: Root?;
    init() {
        self.storage = null;
    }
}