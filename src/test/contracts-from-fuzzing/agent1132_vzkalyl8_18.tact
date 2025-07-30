struct Leaf {
    z: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch;
}

contract BinaryTree {
    tree: Tree = Tree{
        root: Branch{left: null, right: null}
    };
}