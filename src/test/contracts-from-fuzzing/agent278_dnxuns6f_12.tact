struct Leaf {
    value: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
}

contract TreeStorage {
    data: Tree;
    init() {
        self.data = Tree{
            root: Node{
                left: Leaf{ value: 1 },
                right: Leaf{ value: 2 }
            }
        };
    }
}