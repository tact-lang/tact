struct Leaf {
    val: Int?;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Tree {
    left: Branch;
    right: Branch;
}

contract TreeStorage {
    root: Tree;

    init() {
        self.root = Tree{
            left: Branch{
                leaf1: Leaf{val:1},
                leaf2: Leaf{val:null},
            },
            right: Branch{
                leaf1: Leaf{val:null},
                leaf2: Leaf{val:2},
            },
        };
    }
}
