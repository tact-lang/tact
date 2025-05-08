struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    top: Branch;
    bottom: Branch;
}

contract Tree {
    root: Root;

    init() {
        self.root = Root{
            top: Branch{ left: Leaf{ x:1 }, right: Leaf{ x:2 } },
            bottom: Branch{ left: Leaf{ x:3 }, right: Leaf{ x:4 } }
        };
    }
}