struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Node;
}

contract TreeHolder {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Node{
                left: Leaf{ val: 10 },
                right: null
            }
        };
    }
}
