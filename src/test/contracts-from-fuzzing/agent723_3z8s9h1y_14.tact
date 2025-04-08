struct Leaf {
    val: Int;
}

struct Node {
    a: Leaf;
    b: Leaf;
}

struct Top {
    left: Node;
    right: Node;
}

contract TestTree {
    root: Top;

    init() {
        self.root = Top{
            left: Node{
                a: Leaf{ val: 1 },
                b: Leaf{ val: 2 }
            },
            right: Node{
                a: Leaf{ val: 3 },
                b: Leaf{ val: 4 }
            }
        };
    }
}