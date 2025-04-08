struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int;
    f: Int?;
    g: Bool;
    h: Int;
    i: Bool;
    j: Int?;
}

contract LongStructFieldStorage {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 2,
            f: 3,
            g: false,
            h: 4,
            i: true,
            j: null
        };
    }
}