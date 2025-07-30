struct Leaf {
    val: Int;
}

struct Mid {
    left: Leaf;
    right: Leaf;
}

struct Root {
    child1: Mid;
    child2: Mid;
}

contract TreeStorage {
    root: Root;

    init() {
        self.root = Root{
            child1: Mid{ left: Leaf{ val: 1 }, right: Leaf{ val: 2 } },
            child2: Mid{ left: Leaf{ val: 3 }, right: Leaf{ val: 4 } }
        };
    }
}
