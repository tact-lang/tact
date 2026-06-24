struct Leaf { val: Int }
struct Node {
    left: Leaf;
    right: Leaf;
}
struct Root {
    node1: Node;
    node2: Node;
}

contract TreeLike {
    tree: Root;

    init() {
        self.tree = Root{
            node1: Node{ left: Leaf{val:1}, right: Leaf{val:2} },
            node2: Node{ left: Leaf{val:3}, right: Leaf{val:4} }
        };
    }
}