struct Tiny {
    a: Int;
}

struct Small {
    b1: Tiny;
    b2: Tiny;
}

struct Medium {
    c1: Small;
    c2: Small;
}

struct Large {
    d1: Medium;
    d2: Medium;
}

contract Nested {
    big: Large;

    init() {
        self.big = Large{
            d1: Medium{ c1: Small{ b1: Tiny{a:1}, b2: Tiny{a:2} }, c2: Small{ b1:Tiny{a:3}, b2:Tiny{a:4} } },
            d2: Medium{ c1: Small{ b1: Tiny{a:5}, b2: Tiny{a:6} }, c2: Small{ b1:Tiny{a:7}, b2:Tiny{a:8} } }
        };
    }
}