struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
    extra: Int;
}

contract TreeStorage {
    data: Tree;

    init() {
        self.data = Tree{
            root: Node{
                left: Leaf{ val: 10 },
                right: Leaf{ val: 20 },
            },
            extra: 999,
        };
    }

    receive() {}
}