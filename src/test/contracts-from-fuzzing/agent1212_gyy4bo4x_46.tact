struct Leaf {
    v: Int;
}

struct Node {
    child: Leaf?;
}

contract Tree {
    root: Node;
    init() {
        self.root = Node{ child: null };
    }
}