struct Leaf {
    info: String;
}

struct Middle {
    leaf1: Leaf;
    leaf2: Leaf;
    optionalLeaf: Leaf?;
}

struct Root {
    m: Middle;
    num: Int;
}

contract TreeStructStorage {
    root: Root;

    init() {
        self.root = Root{
            m: Middle{
                leaf1: Leaf{ info: "left" },
                leaf2: Leaf{ info: "right" },
                optionalLeaf: null,
            },
            num: 42,
        };
    }
}
