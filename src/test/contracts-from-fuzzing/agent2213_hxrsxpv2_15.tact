struct Mid {
    val: Int;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract MultiMid {
    nested: Top;

    init() {
        self.nested = Top{
            m1: Mid{ val: 111 },
            m2: Mid{ val: 222 },
        };
    }
}
