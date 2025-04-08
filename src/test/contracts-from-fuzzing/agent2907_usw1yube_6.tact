struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch;
}

contract OptionalTree {
    val: Tree;
    init() {
        self.val = Tree{ root: Branch{ left: null, right: null } };
    }
}