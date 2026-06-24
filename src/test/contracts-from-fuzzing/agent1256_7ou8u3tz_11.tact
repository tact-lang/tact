struct Leaf {
    x: Int = 123;
    y: Bool?;
}

struct Mid {
    leaf: Leaf;
}

struct Root {
    mid: Mid = Mid{ leaf: Leaf{} };
}

contract OptionNestDefaults {
    s: Root?;

    init() {
        self.s = null;
    }
}