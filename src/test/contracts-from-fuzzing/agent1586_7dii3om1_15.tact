struct Leaf {
    label: String? = "leaf";
}

struct Node {
    left: Leaf? = null;
    right: Leaf? = null;
}

struct Root {
    node: Node? = null;
}

contract TestContract {
    tree: Root? = null;
    receive() {}
}