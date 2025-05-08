struct Leaf {
    x: Int;
    y: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
    optNode: Node?;
}

contract TreeStorage {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Node{ left: Leaf{x:1,y:2}, right: Leaf{x:3,y:4} },
            optNode: null
        };
    }

    receive() {
        let _ = self.tree.root.left.x;
    }
}