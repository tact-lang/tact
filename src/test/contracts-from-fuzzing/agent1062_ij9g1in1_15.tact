struct InnerMost {
    a: Int;
}

struct Middle {
    l: InnerMost?;
    r: InnerMost?;
}

struct Top {
    m: Middle;
    b: Bool;
}

contract OptionalsEverywhere {
    state: Top;

    init() {
        self.state = Top{
            m: Middle{
                l: null,
                r: InnerMost{a:123}
            },
            b: true
        };
    }
}