struct Sub {
    q: Int;
}

struct Mid {
    r: Int;
    sub: Sub;
}

struct Top {
    p: Bool;
    mid: Mid;
    s: String;
}

contract MultiNested {
    obj: Top;

    init() {
        self.obj = Top {
            p: true,
            mid: Mid {
                r: 123,
                sub: Sub { q: 321 }
            },
            s: "Hello"
        };
    }
}
