struct Leaf {
    a: Int;
    b: Bool;
}

struct Middle {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    m1: Middle;
    m2: Middle;
}

contract WideDeepNested {
    root: Root;

    init() {
        self.root = Root{
            m1: Middle{
                l1: Leaf{a:1, b:true},
                l2: Leaf{a:2, b:false},
            },
            m2: Middle{
                l1: Leaf{a:3, b:true},
                l2: Leaf{a:4, b:false},
            }
        };
    }
}