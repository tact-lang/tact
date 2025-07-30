struct Leaf {
    val: Bool?;
}

struct Node {
    leaf: Leaf;
}

struct Root {
    node: Node;
}

contract DeepNest {
    root: Root;
    init() {
        self.root = Root{
            node: Node{
                leaf: Leaf{ val: null }
            }
        };
    }
}
