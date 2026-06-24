struct BoolOpts {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: Bool?;
    j: Bool?;
}

contract TestContract {
    bits: BoolOpts;

    init() {
        self.bits = BoolOpts{
            a: true,
            b: null,
            c: false,
            d: null,
            e: true,
            f: false,
            g: null,
            h: true,
            i: false,
            j: null
        };
    }
}