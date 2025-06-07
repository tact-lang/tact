struct Small {
    a: Int;
}

struct Big {
    b1: Int;
    b2: Small;
    b3: Small;
    b4: Small;
    b5: Small;
}

contract BigNest {
    s: Big;

    init() {
        self.s = Big{
            b1: 1,
            b2: Small{a:2},
            b3: Small{a:3},
            b4: Small{a:4},
            b5: Small{a:5},
        };
    }
}