struct Node {
    left: Int;
    right: Int;
}

contract TreeShape {
    root: Node;
    leaf: Node;

    init() {
        self.root = Node{ left: 1, right: 2 };
        self.leaf = Node{ left: 3, right: 4 };
    }
}