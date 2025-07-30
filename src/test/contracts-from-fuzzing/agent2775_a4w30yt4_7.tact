struct Leaf {
    value: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    node: Node?;
}

contract OptionalTree {
    root: Root;

    init() {
        self.root = Root{
            node: Node{
                left: Leaf{ value: 1 },
                right: null
            }
        };
    }
}
