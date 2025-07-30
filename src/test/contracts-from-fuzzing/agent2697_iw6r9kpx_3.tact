struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool?;
    m: Int;
    n: Bool;
    o: Int?;
    p: Bool?;
}

contract BigFields {
    vals: ManyFields;

    init() {
        self.vals = ManyFields{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: 3,
            f: true,
            g: null,
            h: null,
            i: 5,
            j: false,
            k: null,
            l: true,
            m: 7,
            n: false,
            o: null,
            p: true,
        };
    }
}
