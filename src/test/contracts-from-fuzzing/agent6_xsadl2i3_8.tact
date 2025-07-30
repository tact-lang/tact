struct Sub {
    a: Int;
}

struct Mid {
    sub: Sub;
}

struct Top {
    mid: Mid;
}

contract Chain {
    d: Top;
    init() {
        self.d = Top{
            mid: Mid{
                sub: Sub{
                    a: 77,
                },
            },
        };
    }
}