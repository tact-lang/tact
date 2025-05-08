struct Flags {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BoolPacking {
    flags: Flags;

    init() {
        self.flags = Flags{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true,
            f: false,
            g: true,
            h: false
        };
    }
}