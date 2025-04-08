struct Node {
    left: Int?;
    right: Int?;
    val: Int;
}

contract BinaryTree {
    root: Node;

    init() {
        self.root = Node{
            left: null,
            right: null,
            val: 42
        };
    }
}
