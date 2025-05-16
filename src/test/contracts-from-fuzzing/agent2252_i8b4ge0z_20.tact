struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    node1: Node?;
    node2: Node?;
}

contract NestedTreeOptional {
    root: Root;
    init() {
        self.root = Root{
            node1: null,
            node2: null
        };
    }
}