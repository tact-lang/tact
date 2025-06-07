struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract TreeStorage {
    tree: Root;

    init() {
        self.tree = Root{
            branch1: Branch{
                left: Leaf{ x: 1 },
                right: Leaf{ x: 2 },
            },
            branch2: Branch{
                left: Leaf{ x: 3 },
                right: Leaf{ x: 4 },
            }
        };
    }
}