struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
}

contract TreeStorage {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Branch{
                left: Leaf{ val: 1 },
                right: Leaf{ val: 2 }
            }
        };
    }
}
