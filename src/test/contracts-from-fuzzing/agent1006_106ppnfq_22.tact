struct Small {
    foo: Int;
}

struct Mid {
    one: Small;
    two: Small;
}

struct Big {
    a: Mid;
    b: Mid;
}

contract StructNestings {
    s: Big;

    init() {
        self.s = Big{
            a: Mid{ one: Small{foo:1}, two: Small{foo:2} },
            b: Mid{ one: Small{foo:3}, two: Small{foo:4} }
        };
    }
}
