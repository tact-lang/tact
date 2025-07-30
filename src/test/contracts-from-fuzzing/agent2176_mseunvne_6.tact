struct Inner {
    flag: Bool;
    num: Int;
}

struct Mid {
    str: String;
    inner: Inner;
    optStr: String?;
}

struct Top {
    id: Int;
    mid1: Mid;
    mid2: Mid;
}

contract ComplexNested {
    state: Top;

    init() {
        self.state = Top{
            id: 7,
            mid1: Mid{
                str: "s1",
                inner: Inner{ flag: true, num: 1 },
                optStr: null
            },
            mid2: Mid{
                str: "s2",
                inner: Inner{ flag: false, num: 2 },
                optStr: "not null"
            }
        };
    }
}
