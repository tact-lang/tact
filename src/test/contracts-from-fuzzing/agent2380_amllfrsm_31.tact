struct Leaf {
    num: Int as uint4;
}

struct Node {
    inner: Leaf? = null;
}

contract TestContract {
    root: Node;
    init() {
        self.root = Node{};
    }
}