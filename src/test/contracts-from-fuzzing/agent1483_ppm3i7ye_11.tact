struct Leaf {
    val: Int?;
}

struct Node1 {
    leaf: Leaf?;
}

struct Node2 {
    node1: Node1?;
}

struct Root {
    node2: Node2?;
}

contract NestedOptionals {
    root: Root;

    init() {
        self.root = Root{ node2: null };
    }
}