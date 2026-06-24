struct InnerMost {
    a: Int as uint4;
    b: Bool;
}

struct MiddleSub {
    subfield: InnerMost;
}

struct TopLevel {
    many: MiddleSub;
    other: Int;
}

contract SerializeDeep {
    d: TopLevel;

    init() {
        self.d = TopLevel{
            many: MiddleSub{ subfield: InnerMost{ a: 5, b: true } },
            other: 256
        };
    }
}
