struct MidNested {
    a: Int;
    b: Int;
}

struct TopLevel {
    first: MidNested;
    second: MidNested;
    third: Int;
}

contract MultiInnerStructStd {
    s: TopLevel;

    init() {
        self.s = TopLevel{
            first: MidNested{ a: 1, b: 2 },
            second: MidNested{ a: 3, b: 4 },
            third: 5,
        };
    }
}