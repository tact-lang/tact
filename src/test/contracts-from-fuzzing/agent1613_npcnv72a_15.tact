struct Leaf {
    value: Int;
}

struct Tree {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalSubtrees {
    tree: Tree;

    init() {
        self.tree = Tree{
            left: null,
            right: Leaf{value: 42},
        };
    }
}
