struct Leaf {
    name: String;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Tree {
    branch: Branch;
}

contract TreeStorage {
    root: Tree;

    init() {
        self.root = Tree{
            branch: Branch{
                leaf1: Leaf{name: "L1"},
                leaf2: Leaf{name: "L2"},
            },
        };
    }
}