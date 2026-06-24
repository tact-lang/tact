struct Leaf {
    val: Int;
}

struct Mid {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Root {
    mid: Mid;
}

contract NestedStructs {
    root: Root;

    init() {
        self.root = Root{mid: Mid{leaf1: Leaf{val: 1}, leaf2: Leaf{val: 2}}};
    }
}