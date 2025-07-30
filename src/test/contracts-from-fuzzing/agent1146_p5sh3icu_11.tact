struct Leaf {
    k: Int;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    b1: Branch;
    b2: Branch;
}

contract TreeTest {
    tree: Root;

    init() {
        self.tree = Root{
            b1: Branch{ l1: Leaf{ k:1 }, l2: Leaf{ k:2 } },
            b2: Branch{ l1: Leaf{ k:3 }, l2: Leaf{ k:4 } }
        };
    }
}