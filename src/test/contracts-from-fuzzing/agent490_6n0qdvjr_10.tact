struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    top: Branch;
    bottom: Branch;
}

contract TreeHolder {
    tree: Tree;
    init() {
        self.tree = Tree{
            top: Branch{ left: Leaf{val:1}, right: Leaf{val:2} },
            bottom: Branch{ left: Leaf{val:3}, right: Leaf{val:4} }
        };
    }
}