struct Small {
    a: Int;
    b: Int;
}

struct Mid {
    c: Small;
    d: Int;
}

struct Large {
    e: Mid;
    f: Bool;
}

contract TestContract {
    big: Large;

    init() {
        self.big = Large{
            e: Mid{
                c: Small{ a: 1, b: 2 },
                d: 3
            },
            f: false
        };
    }
}