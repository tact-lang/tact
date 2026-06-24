struct Deep {
    d1: Int;
    d2: String;
}

struct Mid {
    m1: Int?;
    d: Deep;
}

struct Top {
    t1: Bool;
    m: Mid;
}

contract DeepMixNested {
    value: Top;

    init() {
        self.value = Top{
            t1: true,
            m: Mid{
                m1: null,
                d: Deep{ d1: 42, d2: "deep" }
            }
        };
    }
}
