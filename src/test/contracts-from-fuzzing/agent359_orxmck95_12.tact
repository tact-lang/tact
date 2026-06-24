struct Leaf {
    num: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract TestContract {
    root: Tree;

    init() {
        self.root = Tree{ branch: null };
    }
}