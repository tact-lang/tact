struct Leaf {
    v: Int;
}

struct Node {
    l: Leaf?;
    r: Leaf?;
}

struct Tree {
    root: Node?;
}

contract BinTree {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Node{
                l: Leaf{v:1},
                r: null,
            },
        };
    }
}