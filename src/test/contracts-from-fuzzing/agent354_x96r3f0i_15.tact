struct Leaf { z: Int; }

struct Node {
    value: Int;
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    node1: Node;
    node2: Node;
}

contract BinaryPattern {
    data: Root;

    init() {
        self.data = Root{
            node1: Node{ value: 1, left: null, right: null },
            node2: Node{ value: 2, left: null, right: null },
        };
    }
}
