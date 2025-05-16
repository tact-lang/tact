struct Leaf {
    val: Int?;
}

struct Node {
    left: Leaf;
    right: Leaf;
    mid: Leaf;
}

contract OptionalTree {
    data: Node;

    init() {
        self.data = Node{
            left: Leaf{val: null},
            right: Leaf{val: null},
            mid: Leaf{val: null}
        };
    }
}
