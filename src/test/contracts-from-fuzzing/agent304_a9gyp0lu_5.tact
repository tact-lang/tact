struct Leaf {
    val: Int;
}

struct Middle {
    l1: Leaf;
    l2: Leaf;
}

struct Top {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract DeepWide {
    root: Top;
    init() {
        self.root = Top{
            m1: Middle{ l1: Leaf{val:1}, l2: Leaf{val:2} },
            m2: Middle{ l1: Leaf{val:3}, l2: Leaf{val:4} },
            m3: Middle{ l1: Leaf{val:5}, l2: Leaf{val:6} },
        };
    }
}
