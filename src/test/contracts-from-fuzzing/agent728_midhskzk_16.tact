struct Leaf {
    value: Int?;
}

struct Node {
    leaf: Leaf?;
    name: String;
}

contract OptionalNest {
    node: Node?;

    init() {
        self.node = Node{
            leaf: null,
            name: "node"
        };
    }
}