struct Leaf {
    a: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Node?;
}

contract TestOptTree {
    data: Tree;

    init() {
        self.data = Tree{root: null};
    }

    receive() {
        let tmp = self.data;
    }
}