struct Leaf {
    value: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    node1: Node;
    node2: Node;
}

contract TestTree {
    root: Root;

    init() {
        self.root = Root{
            node1: Node{
                left: Leaf{ value: 1 },
                right: null
            },
            node2: Node{
                left: null,
                right: Leaf{ value: 2 }
            }
        };
    }
}
