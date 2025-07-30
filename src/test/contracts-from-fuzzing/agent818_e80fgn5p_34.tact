struct Leaf {
    x: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract OptTree {
    root: Node?;

    init() {
        self.root = null;
    }
}