struct Leaf {
    x: Int;
    y: Bool;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract Test {
    root: Node;
    init() {
        self.root = Node{
            left: null,
            right: Leaf{ x: 7, y: false }
        };
    }
}