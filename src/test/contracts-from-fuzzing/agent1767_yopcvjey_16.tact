struct Small { a: Int; }

struct Mid { s1: Small; s2: Small; }

struct Big { m1: Mid; m2: Mid; }

contract WideNested {
    b: Big;

    init() {
        self.b = Big{
            m1: Mid{ s1: Small{a:1}, s2: Small{a:2} },
            m2: Mid{ s1: Small{a:3}, s2: Small{a:4} }
        };
    }
}
