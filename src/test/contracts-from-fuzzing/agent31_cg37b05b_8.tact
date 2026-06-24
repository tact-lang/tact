struct Leaf {
    x: Int;
}

struct Mid {
    l1: Leaf;
    l2: Leaf;
    l3: Leaf;
}

struct Root {
    m1: Mid;
    m2: Mid;
}

contract MultilevelTree {
    tree: Root;

    init() {
        self.tree = Root{
            m1: Mid{
                l1: Leaf{ x: 1 },
                l2: Leaf{ x: 2 },
                l3: Leaf{ x: 3 }
            },
            m2: Mid{
                l1: Leaf{ x: 4 },
                l2: Leaf{ x: 5 },
                l3: Leaf{ x: 6 }
            }
        };
    }
}