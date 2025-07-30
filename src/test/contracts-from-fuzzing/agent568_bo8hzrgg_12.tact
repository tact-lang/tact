struct Sub {
    a: Int;
}

struct Mid {
    s1: Sub;
    s2: Sub;
}

struct Top {
    first: Mid;
    second: Mid;
}

contract LargeNest {
    store: Top;

    init() {
        self.store = Top{
            first: Mid{
                s1: Sub{a: 1},
                s2: Sub{a: 2}
            },
            second: Mid{
                s1: Sub{a: 3},
                s2: Sub{a: 4}
            }
        };
    }
}