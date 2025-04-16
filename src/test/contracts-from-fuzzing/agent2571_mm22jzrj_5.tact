struct Tiny {
    a: Int;
}

struct Mid {
    t: Tiny;
    b: Bool;
}

contract MultiType {
    s: Mid;

    init() {
        self.s = Mid{
            t: Tiny{
                a: -1,
            },
            b: true,
        };
    }
}
