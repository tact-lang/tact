struct Tiny {
    x: Int;
}

struct Mid {
    t: Tiny;
}

struct Big {
    m1: Mid;
    m2: Mid;
    m3: Mid;
    m4: Mid;
    m5: Mid;
}

contract BigNested {
    storage: Big;

    init() {
        self.storage = Big{
            m1: Mid{ t: Tiny{ x: 1 } },
            m2: Mid{ t: Tiny{ x: 2 } },
            m3: Mid{ t: Tiny{ x: 3 } },
            m4: Mid{ t: Tiny{ x: 4 } },
            m5: Mid{ t: Tiny{ x: 5 } },
        };
    }
}
