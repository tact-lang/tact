struct Deep {
    x: Int;
}

struct Mid {
    d1: Deep;
    d2: Deep;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract VeryDeep {
    data: Top;

    init() {
        self.data = Top{
            m1: Mid{
                d1: Deep{ x: 1 },
                d2: Deep{ x: 2 },
            },
            m2: Mid{
                d1: Deep{ x: 3 },
                d2: Deep{ x: 4 },
            },
        };
    }
}