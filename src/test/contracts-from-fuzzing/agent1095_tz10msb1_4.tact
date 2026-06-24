struct Small {
    a: Int;
}

struct Mid {
    m1: Int;
    m2: Int?;
    m3: Small;
}

struct Big {
    b1: Int;
    b2: Bool;
    b3: Mid;
    b4: Bool?;
    b5: Int;
}

contract ManyFields {
    f1: Big;
    f2: Int;
    f3: Bool;
    f4: Int?;

    init() {
        self.f1 = Big{
            b1: 10,
            b2: true,
            b3: Mid{
                m1: 20,
                m2: null,
                m3: Small{a: 30}
            },
            b4: null,
            b5: 40
        };
        self.f2 = 50;
        self.f3 = false;
        self.f4 = null;
    }
}