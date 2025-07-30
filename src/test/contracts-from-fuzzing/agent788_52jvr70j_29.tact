struct Leaf {
    a: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract BinaryTree {
    root: Node;

    init() {
        self.root = Node{
            left: null,
            right: null
        };
    }
}