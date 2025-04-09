struct InnerMix {
    a: Int = 1;
    b: Int?;
    c: Int? = null;
    d: Bool = false;
    e: Bool? = true;
}

struct OuterMix {
    inn: InnerMix;
    x: Int;
    y: Int? = null;
    z: Bool? = false;
}

contract MixNestDefaults {
    dat: OuterMix;

    init() {
        self.dat = OuterMix{
            inn: InnerMix{
                a: 10,
                b: 20,
                c: null,
                d: true,
                e: false
            },
            x: 99,
            y: 42,
            z: true
        };
    }
}