struct Tiny {
    a: Int;
}

struct Middle {
    t1: Tiny;
    t2: Tiny;
}

struct Big {
    m1: Middle;
    m2: Middle;
}

contract TwinNest {
    b: Big;

    init() {
        self.b = Big{
            m1: Middle{
                t1: Tiny{a:1},
                t2: Tiny{a:2}
            },
            m2: Middle{
                t1: Tiny{a:3},
                t2: Tiny{a:4}
            }
        };
    }
}
