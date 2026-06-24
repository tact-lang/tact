// Deep optional nullable persistent nested struct fields
struct Leaf {
    x: Int?;
}

struct Node {
    leaf: Leaf?;
}

struct Tree {
    left: Node?;
    right: Node?;
}

contract TestContract {
    tree: Tree?;

    init() {
        self.tree = null;
    }
}