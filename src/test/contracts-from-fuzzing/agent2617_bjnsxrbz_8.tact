struct Tiny {
    one: Int;
}

struct MidTiny {
    t1: Tiny;
    t2: Tiny;
}

struct Big {
    m1: MidTiny;
    m2: MidTiny;
    m3: MidTiny;
    active: Bool;
}

contract BigNested {
    val: Big;
    init() {
        self.val = Big{
            m1: MidTiny{
                t1: Tiny{one: 1},
                t2: Tiny{one: 2}
            },
            m2: MidTiny{
                t1: Tiny{one: 3},
                t2: Tiny{one: 4}
            },
            m3: MidTiny{
                t1: Tiny{one: 5},
                t2: Tiny{one: 6}
            },
            active: true
        };
    }
}