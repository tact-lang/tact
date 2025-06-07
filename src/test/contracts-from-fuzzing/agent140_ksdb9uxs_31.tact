struct Leaf {v: Int}

struct Node {
    l: Leaf;
    r: Leaf;
}

struct Root {
    left: Node;
    right: Node;
}

contract TreeLike {
    root: Root;

    init() {
        self.root = Root{
            left: Node{ l: Leaf{v:1}, r: Leaf{v:2} },
            right: Node{ l: Leaf{v:3}, r: Leaf{v:4} }
        };
    }
}