struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract Tree {
    tree: Root;

    init() {
        self.tree = Root{
            branch1: Branch{
                left: Leaf{ val: 1 },
                right: Leaf{ val: 2 },
            },
            branch2: Branch{
                left: Leaf{ val: 3 },
                right: Leaf{ val: 4 },
            }
        };
    }
}