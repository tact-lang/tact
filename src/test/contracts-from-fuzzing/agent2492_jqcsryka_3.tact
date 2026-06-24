struct Deep {
    d1: Int?;
    d2: Bool;
}

struct Mid {
    m1: Int;
    m2: Deep;
}

struct Top {
    t1: Mid;
    t2: Int;
}

contract DeepOptionContract {
    top: Top;

    init() {
        self.top = Top{
            t1: Mid{
                m1: 777,
                m2: Deep{d1: null, d2: true}
            },
            t2: 123
        };
    }
}