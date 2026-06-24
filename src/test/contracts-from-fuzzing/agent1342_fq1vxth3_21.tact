struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct TreeTop {
    root: Node;
}

contract TreeVariants {
    storage: TreeTop;

    init() {
        self.storage = TreeTop{
            root: Node{
                left: Leaf{ val:1 },
                right: Leaf{ val:2 },
            }
        };
    }
}