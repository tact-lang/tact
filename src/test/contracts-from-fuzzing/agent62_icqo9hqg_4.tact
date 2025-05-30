struct Deep {
    level: Int;
}

struct Mid {
    d1: Deep;
    d2: Deep;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract WideNested {
    storage: Top;

    init() {
        self.storage = Top{
            m1: Mid{ d1: Deep{level: 1}, d2: Deep{level: 2} },
            m2: Mid{ d1: Deep{level: 3}, d2: Deep{level: 4} },
        };
    }
}