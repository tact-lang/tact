struct Leaf {
    l1: Int;
    l2: Bool;
}

struct Middle {
    m1: Leaf;
    m2: Leaf;
}

struct Root {
    r1: Middle;
    r2: Middle;
}

contract Test11 {
    data: Root;

    init() {
        self.data = Root{
            r1: Middle{
                m1: Leaf{ l1: 1, l2: true },
                m2: Leaf{ l1: 2, l2: false }
            },
            r2: Middle{
                m1: Leaf{ l1: 3, l2: true },
                m2: Leaf{ l1: 4, l2: false }
            }
        };
    }
}
