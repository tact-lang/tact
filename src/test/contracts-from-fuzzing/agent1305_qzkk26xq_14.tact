struct Leaf {
    x: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract TreeTest {
    root: Node?;

    init() {
        self.root = Node{
            left: Leaf{ x: 5 },
            right: null,
        };
    }
}