struct InnerMost {
    large: Int as int255;
    flag: Bool?;
    note: String?;
}

struct Middle {
    inner: InnerMost?;
    small: Int as uint4;
}

struct TopLevel {
    mid: Middle;
    headline: String;
}

contract WideOptionalComplex {
    state: TopLevel;

    init() {
        self.state = TopLevel{
            mid: Middle{
                inner: null,
                small: 3,
            },
            headline: "head",
        };
    }
}