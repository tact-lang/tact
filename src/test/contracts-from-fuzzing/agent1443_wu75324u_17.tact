struct InnerMost {
    s: String;
}

struct Middle {
    i: Int;
    im: InnerMost;
}

struct OuterWrapper {
    m: Middle;
    flag: Bool;
}

contract VeryDeep {
    data: OuterWrapper;

    init() {
        self.data = OuterWrapper{
            m: Middle{ i: 10, im: InnerMost{ s: "deep" } },
            flag: false,
        };
    }
}