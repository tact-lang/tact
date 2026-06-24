struct Leaf {
    a: Int;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    b1: Branch;
    b2: Branch;
}

contract TreeStruct {
    root: Root;

    init() {
        self.root = Root{
            b1: Branch{ l1: Leaf{ a: 1 }, l2: Leaf{ a: 2 } },
            b2: Branch{ l1: Leaf{ a: 3 }, l2: Leaf{ a: 4 } }
        };
    }
}