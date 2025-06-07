struct OptionalFlags {
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

contract Test {
    of: OptionalFlags;

    init() {
        self.of = OptionalFlags{
            a: null,
            b: true,
            c: false,
            d: null,
            e: true,
            f: null,
            g: false,
            h: true,
            i: null,
            j: false,
        };
    }
}