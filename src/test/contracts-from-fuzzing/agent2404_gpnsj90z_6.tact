struct Leaf {
    z: Int;
}

struct Mid {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Root {
    id: Int;
    node: Mid;
    optNode: Mid?;
    flag: Bool;
}

contract ComplexPersistence {
    root: Root;

    init() {
        self.root = Root{
            id: 11,
            node: Mid{leaf1: Leaf{z: 1}, leaf2: Leaf{z: 2}},
            optNode: null,
            flag: true
        };
    }
}