struct Leaf {
    x: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    node: Node?;
}

contract OptOptTest {
    data: Root;
    init() {
        self.data = Root{
            node: Node{
                left: null,
                right: null
            }
        };
    }
}