struct Leaf { val: Int; }

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    lnode: Node?;
    rnode: Node?;
}

contract OptTree {
    tree: Root?;

    init() {
        self.tree = null;
    }

    receive() {
        self.tree = Root{
            lnode: Node{
                left: Leaf{ val: 1 },
                right: null
            },
            rnode: null
        };
    }
}