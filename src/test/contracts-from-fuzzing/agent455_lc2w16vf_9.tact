struct BoolPacked {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract ManyBools {
    flags: BoolPacked;

    init() {
        self.flags = BoolPacked{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true,
            f: false,
            g: true,
            h: false,
        };
    }
}