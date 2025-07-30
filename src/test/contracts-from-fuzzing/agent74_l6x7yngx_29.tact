struct Leaf {
    a: Int;
    b: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract Tree {
    root: Node?;

    init() {
        self.root = null;
    }
}