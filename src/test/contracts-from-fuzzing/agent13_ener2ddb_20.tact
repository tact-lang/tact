struct Leaf {
    v: Int;
}

struct Tree {
    left: Leaf?;
    right: Leaf?;
}

contract BinaryTree {
    tree: Tree;

    init() {
        self.tree = Tree{
            left: Leaf{ v: 1 },
            right: null
        };
    }
}