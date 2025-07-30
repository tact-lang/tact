struct Leaf {
    x: Int;
    y: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract DeepTree {
    tree: Root;

    init() {
        self.tree = Root{
            branch1: Branch{ left: Leaf{ x:1, y:2 }, right: Leaf{ x:3, y:4 } },
            branch2: Branch{ left: Leaf{ x:5, y:6 }, right: Leaf{ x:7, y:8 } }
        };
    }
}