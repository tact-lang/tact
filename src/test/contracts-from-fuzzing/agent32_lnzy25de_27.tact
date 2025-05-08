struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
    label: String?;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: null,
            label: null,
        };
    }
}