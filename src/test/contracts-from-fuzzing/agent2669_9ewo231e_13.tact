struct Leaf {
    leafField: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Node {
    branch: Branch;
}

contract Tree {
    root: Node;

    init() {
        self.root = Node{
            branch: Branch{
                left: Leaf{ leafField: 1 },
                right: Leaf{ leafField: 2 },
            }
        };
    }
}
