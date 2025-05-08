struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct Mid {
    d: Opts;
    e: Int;
}

struct Top {
    f: Mid;
    g: Slice;
}

contract TestContract {
    t: Top;

    init() {
        self.t = Top{
            f: Mid{
                d: Opts{
                    a: null,
                    b: null,
                    c: null,
                },
                e: 5,
            },
            g: emptyCell().asSlice(),
        };
    }
}