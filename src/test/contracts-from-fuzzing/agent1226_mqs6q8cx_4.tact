struct Leaf {
    val: Int?;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Node?;
}

contract Forest {
    tree: Tree;

    init() {
        self.tree = Tree{ root: null };
    }
}