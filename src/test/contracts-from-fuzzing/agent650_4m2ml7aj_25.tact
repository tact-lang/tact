// Nested struct tree, mixture of optional and concrete fields
struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    leftBranch: Branch;
    rightBranch: Branch?;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            leftBranch: Branch{ left:null, right:null },
            rightBranch: null
        };
    }
}
