struct Leaf { x: Int; }

struct Node {
    left: Leaf? = null;
    right: Leaf? = null;
}

struct Tree {
    root: Node? = null;
}

contract TestContract {
    storage: Tree;

    init() {
        self.storage = Tree{};  // all optionals default null
    }
}