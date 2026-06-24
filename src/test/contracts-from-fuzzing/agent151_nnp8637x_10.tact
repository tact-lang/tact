struct Deep {
    v: Int;
}

struct Mid {
    d: Deep?;
    s: String?;
}

struct Top {
    m: Mid?;
    f: Bool;
}

contract Test {
    s: Top;

    init() {
        self.s = Top{
            m: Mid{
                d: Deep{ v: 42 },
                s: null,
            },
            f: true,
        };
    }
}