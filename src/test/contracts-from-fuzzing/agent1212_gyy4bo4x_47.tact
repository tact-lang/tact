struct Leaf {
    v: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract Tree2 {
    root: Node;
    init() {
        self.root = Node{ left:null, right:null };
    }
}