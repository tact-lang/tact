struct Leaf {
    data: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalTree {
    root: Node;

    init() {
        self.root = Node{
            left: null,
            right: Leaf{ data: 77 }
        };
    }
}
