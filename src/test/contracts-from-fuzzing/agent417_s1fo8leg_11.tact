struct Leaf {
    x: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    left: Branch?;
    right: Branch?;
}

contract TestContract {
    treeState: Tree;

    init() {
        self.treeState = Tree{
            left: null,
            right: Branch{ leaf: null }
        };
    }
}