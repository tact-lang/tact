struct Leaf {
    num: Int?;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract AllNullTree {
    root: Node;
    init() {
        self.root = Node{};
    }
}