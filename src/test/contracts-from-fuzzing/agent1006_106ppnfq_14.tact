struct Leaf {
    leafVal: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

struct Tree {
    root: Branch;
    backup: Branch?;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Branch{ left:Leaf{leafVal:1}, right:null },
            backup: null
        };
    }
}
