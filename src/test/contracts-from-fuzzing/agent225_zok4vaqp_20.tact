struct Leaf {
    x: Int?;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
    l3: Leaf;
    l4: Leaf;
    l5: Leaf;
}

contract TestTree {
    branch: Branch;

    init() {
        self.branch = Branch{
            l1: Leaf{ x: null },
            l2: Leaf{ x: 1 },
            l3: Leaf{ x: null },
            l4: Leaf{ x: 2 },
            l5: Leaf{ x: null }
        };
    }
}