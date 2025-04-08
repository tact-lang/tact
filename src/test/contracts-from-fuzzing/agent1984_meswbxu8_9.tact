struct Tiny {
    a: Int;
}

struct Mid {
    a: Tiny;
    b: Tiny;
}

struct Big {
    x: Mid;
    y: Mid;
    z: Mid;
}

contract MultiNest {
    val: Big;

    init() {
        self.val = Big{
            x: Mid{ a: Tiny{a:1}, b:Tiny{a:2} },
            y: Mid{ a: Tiny{a:3}, b:Tiny{a:4} },
            z: Mid{ a: Tiny{a:5}, b:Tiny{a:6} },
        };
    }
}