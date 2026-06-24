struct Leaf {
    z: Int = 999;
}

struct Node {
    leaf: Leaf;
    y: Int = 42;
}

struct Root {
    node: Node;
    x: Int;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            node: Node{
                leaf: Leaf{},
                y: 123
            },
            x: 7
        };
    }
}