struct Small {
    a: Int;
}

struct Mid {
    b: Small;
    c: Int?;
}

struct Big {
    d: Mid;
    e: Bool;
    f: Bool?;
}

contract Huge {
    big: Big;
    init() {
        self.big = Big{
            d: Mid{b: Small{a: 10}, c: null},
            e: true,
            f: null
        };
    }
}