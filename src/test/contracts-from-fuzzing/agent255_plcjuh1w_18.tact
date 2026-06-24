struct Leaf {
    leafVal: Int;
}

struct Mid {
    left: Leaf;
    right: Leaf;
}

struct Root {
    mid1: Mid;
    mid2: Mid;
}

contract BinaryTree {
    root: Root;

    init() {
        self.root = Root{
            mid1: Mid{left: Leaf{leafVal:1}, right: Leaf{leafVal:2}},
            mid2: Mid{left: Leaf{leafVal:3}, right: Leaf{leafVal:4}},
        };
    }
}