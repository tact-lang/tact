struct Deep {
    d1: Int;
    d2: Int?;
}

struct Mid {
    m1: Deep;
    m2: Int;
}

struct Top {
    t1: Mid;
    t2: Int?;
}

contract TestContract {
    value: Top;

    init() {
        self.value = Top{
            t1: Mid{
                m1: Deep{
                    d1: 7,
                    d2: null,
                },
                m2: 8,
            },
            t2: null,
        };
    }
}