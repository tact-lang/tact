struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Root {
    n1: Node;
    n2: Node;
}

contract TreeLikePersistent {
    root: Root;

    init() {
        self.root = Root{
            n1: Node{
                left: Leaf{ val: 1 },
                right: Leaf{ val: 2 },
            },
            n2: Node{
                left: Leaf{ val: 3 },
                right: Leaf{ val: 4 },
            }
        };
    }
}