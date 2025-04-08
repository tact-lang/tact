struct Leaf {
    x: Int;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    mid: Mid;
}

contract NestedStructStorage {
    val: Top;

    init() {
        self.val = Top{mid: Mid{leaf: Leaf{x: 7}}};
    }
}