struct Deep {
    a: Int;
    b: Bool;
}

struct Mid {
    d1: Deep;
    d2: Deep;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract DeepNested {
    storage: Top;

    init() {
        self.storage = Top{
            m1: Mid{
                d1: Deep{a: 1, b: true},
                d2: Deep{a: 2, b: false}
            },
            m2: Mid{
                d1: Deep{a: 3, b: true},
                d2: Deep{a: 4, b: false}
            }
        };
    }
}
