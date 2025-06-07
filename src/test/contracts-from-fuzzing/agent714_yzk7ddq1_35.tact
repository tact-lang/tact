struct Leaf {
    foo: Int;
}

struct Node {
    leaf: Leaf;
}

struct Tree {
    node: Node;
}

contract TreeWrap {
    t: Tree;

    init() {
        self.t = Tree{ node: Node{ leaf: Leaf{ foo: 88 } } };
    }
}