struct Leaf {
    v: Int? as uint8;
}

struct Node {
    leaf: Leaf;
}

contract TestC {
    node: Node;

    init() {
        self.node = Node{ leaf: Leaf{ v: 123 } };
    }
}