struct Leaf {
    x: Int? as uint32 = null;
    y: Bool? = null;
}

struct Mid {
    l1: Leaf;
    l2: Leaf;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract TestContract {
    t: Top;
    init() {
        self.t = Top{
            m1: Mid{
                l1: Leaf{},
                l2: Leaf{}
            },
            m2: Mid{
                l1: Leaf{},
                l2: Leaf{}
            }
        };
    }
}