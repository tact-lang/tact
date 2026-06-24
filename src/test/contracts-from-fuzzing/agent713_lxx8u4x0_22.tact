struct Leaf {
    x: Int;
}

struct Mid {
    l: Leaf;
}

struct Root {
    m1: Mid;
    m2: Mid;
}

contract NestedSiblings {
    root: Root;

    init() {
        self.root = Root{
            m1: Mid{ l: Leaf{ x: 1 } },
            m2: Mid{ l: Leaf{ x: 2 } }
        };
    }
}