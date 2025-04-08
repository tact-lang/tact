struct InnerMost {
    f: Int?;
}

struct MiddleLevel {
    i: InnerMost;
}

struct TopLevel {
    m: MiddleLevel?;
}

contract RecursiveOptional {
    s: TopLevel;

    init() {
        self.s = TopLevel{
            m: null
        };
    }
}
