struct InnerDeep {
    q: String;
    r: Bool;
    s: Int;
}

struct MiddleDeep {
    e: Int;
    f: InnerDeep;
}

struct OuterDeep {
    a: MiddleDeep;
    b: Int;
    c: Int;
}

contract MultiLevelNested {
    n: OuterDeep;

    init() {
        self.n = OuterDeep{
            a: MiddleDeep{ e: 8, f: InnerDeep{ q: "hi", r: false, s: -5 } },
            b: 99,
            c: -77
        };
    }
}