struct ManyBooleans {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    f: Bool?;
    g: Bool;
    h: Bool?;
}

contract ManyBools {
    mb: ManyBooleans;

    init() {
        self.mb = ManyBooleans{
            a: true,
            b: null,
            c: false,
            d: null,
            e: true,
            f: null,
            g: false,
            h: null,
        };
    }
}
