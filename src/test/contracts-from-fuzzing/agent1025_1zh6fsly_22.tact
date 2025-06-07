struct Leaf {
    leafVal: Int;
}

struct Middle {
    left: Leaf;
    right: Leaf;
}

struct Root {
    m1: Middle;
    m2: Middle;
}

contract BinaryTree {
    r: Root;

    init() {
        self.r = Root{
            m1: Middle{ left: Leaf{leafVal:1}, right: Leaf{leafVal:2} },
            m2: Middle{ left: Leaf{leafVal:3}, right: Leaf{leafVal:4} }
        };
    }
}
