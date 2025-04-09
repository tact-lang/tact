struct InnerMost {
    a: Int;
}

struct MiddleLevel {
    m: InnerMost;
}

struct TopLevel {
    t: MiddleLevel;
}

contract MultiLayer {
    s: TopLevel;

    init() {
        self.s = TopLevel{
            t: MiddleLevel{ m: InnerMost{ a: 321 } }
        };
    }
}