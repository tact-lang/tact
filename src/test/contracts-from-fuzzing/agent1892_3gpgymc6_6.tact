struct InnerMost {
    value: Int;
}

struct Mid {
    inner1: InnerMost;
    inner2: InnerMost;
}

struct Outer {
    m1: Mid;
    m2: Mid;
    flag: Bool;
}

contract MultiNested {
    state: Outer;

    init() {
        self.state = Outer{
            m1: Mid{
                inner1: InnerMost{ value: 1 },
                inner2: InnerMost{ value: 2 },
            },
            m2: Mid{
                inner1: InnerMost{ value: 3 },
                inner2: InnerMost{ value: 4 },
            },
            flag: true,
        };
    }
}