struct Leaf {
    v1: Int;
    v2: Bool;
}

struct Middle {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Root {
    m1: Middle;
    m2: Middle;
}

contract DeeplyNested {
    root: Root;

    init() {
        self.root = Root{
            m1: Middle{ leaf1: Leaf{ v1: 1, v2: true }, leaf2: Leaf{ v1: 2, v2: false } },
            m2: Middle{ leaf1: Leaf{ v1: 3, v2: true }, leaf2: Leaf{ v1: 4, v2: false } }
        };
    }
}