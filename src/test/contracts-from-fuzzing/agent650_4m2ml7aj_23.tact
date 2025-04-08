// Optional nested grain tree
struct Leaf {
    a: Int?;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    leftNode: Node?;
    rightNode: Node?;
}

contract TestContract {
    root: Root?;

    init() {
        self.root = null;
    }
}
