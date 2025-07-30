struct Deep {
    d1: Int;
    d2: String?;
}

struct Middle {
    m1: Bool;
    m2: Deep;
}

struct Top {
    t1: Int;
    t2: Middle;
}

contract TestDeepNested {
    nested: Top;

    init() {
        self.nested = Top{
            t1: 42,
            t2: Middle{
                m1: true,
                m2: Deep{
                    d1: 7,
                    d2: "deep optional"
                }
            }
        };
    }
}