struct Leaf {
    a: Int?;
    b: Bool?;
}

struct Node {
    x: Int?;
    leaf: Leaf?;
}

contract OptNest {
    data: Node?;

    init() {
        self.data = Node {
            x: null,
            leaf: Leaf { a: null, b: null }
        };
    }
}
