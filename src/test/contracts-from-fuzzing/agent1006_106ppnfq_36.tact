struct Leaf {
    x: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Node;
}

contract StorageTree {
    t: Tree;

    init() {
        self.t = Tree{
            root: Node{ left:null, right:null }
        };
    }
}
