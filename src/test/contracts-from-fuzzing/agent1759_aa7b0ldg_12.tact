// nested structs with optional fields
struct Leaf {
    value: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract TestContract {
    treeData: Tree;

    init() {
        self.treeData = Tree{ root: null };
    }

    receive() {}
}