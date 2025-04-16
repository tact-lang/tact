struct Leaf {
    foo: Int;
}

struct Node {
    leaf: Leaf;
}

contract Test {
    node: Node;

    init() {
        self.node = Node{
            leaf: Leaf{
                foo: 7
            }
        };
    }
}
