struct Leaf {
    value: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract OptionalBranch {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: null
        };
    }

    receive() {
        let _=self.tree;
    }
}