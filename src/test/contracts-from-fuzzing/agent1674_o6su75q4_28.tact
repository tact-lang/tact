struct Large {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: Int as uint16;
    g: Int? as uint8;
    h: String?;
    i: Bool;
    j: Int;
    k: String?;
    l: Int?;
    m: Bool?;
    n: String;
    o: Int?;
}

contract BigPersistent {
    rec: Large;

    init() {
        self.rec = Large{
            a: 1,
            b: false,
            c: null,
            d: "x",
            e: null,
            f: 17,
            g: null,
            h: null,
            i: true,
            j: -7,
            k: null,
            l: null,
            m: null,
            n: "y",
            o: null,
        };
    }
}