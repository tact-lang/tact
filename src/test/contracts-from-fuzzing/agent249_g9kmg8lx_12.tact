struct Leaf {
    a: Int;
    b: String?;
}

struct Node {
    left: Leaf;
    right: Leaf?;
}

struct Tree {
    root: Node;
    comment: String;
}

contract DeepTree {
    persistent: Tree;

    init() {
        self.persistent = Tree{
            root: Node{
                left: Leaf{ a: 1, b: "L" },
                right: Leaf{ a: 2, b: null }
            },
            comment: "nested"
        };
    }

    receive() {
        let _ = self.persistent.root.left.a;
    }
}