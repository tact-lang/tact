struct Leaf {
    value: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
}

contract TreeContract {
    tree: Tree?;

    init() {
        self.tree = null;
    }
}