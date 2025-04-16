struct Leaf {
    val: Int?;
}

struct Node {
    leaf: Leaf?;
}

contract TestC {
    node: Node;

    init() {
        self.node = Node{ leaf: Leaf{ val: null } };
    }
}