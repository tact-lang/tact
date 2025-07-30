struct Leaf {
    v1: Int;
    v2: String?;
}

struct Node {
    left: Leaf;
    right: Leaf?;
}

contract TreeLike {
    top: Node?;

    init() {
        self.top = null;
    }
}
