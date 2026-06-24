struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Root {
    top: Node;
    bottom: Node;
}

contract BinaryTreePersistent {
    root: Root;

    init() {
        self.root = Root{
            top: Node{ left: Leaf{val:1}, right: Leaf{val:2} },
            bottom: Node{ left: Leaf{val:3}, right: Leaf{val:4} }
        };
    }
}