struct Leaf {
    a: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
    child: Node;
}

contract TestContract {
    t: Tree;

    init() {
        self.t = Tree{
            root: Node{ left: Leaf{a:1}, right: Leaf{a:2} },
            child: Node{ left: Leaf{a:3}, right: Leaf{a:4} }
        };
    }
}