struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
}

contract TestContract {
    storage: Tree;

    init() {
        self.storage = Tree {
            root: Branch {
                left: Leaf{val: null},
                right: Leaf{val: 42}
            }
        };
    }
}