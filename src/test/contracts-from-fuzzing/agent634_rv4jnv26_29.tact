// deeply nested with optional in deepest struct, used as persistent
struct Leaf {
    val: Int?;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    mid: Mid;
}

contract DeeplyOptional {
    root: Top;

    init() {
        self.root = Top{mid: Mid{leaf: Leaf{val: null}}};
    }
}