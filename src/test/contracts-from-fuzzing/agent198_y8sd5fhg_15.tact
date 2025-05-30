struct Big {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
    i: Int?;
    j: Bool?;
    k: String;
    l: String?;
}

contract WidePersistent {
    store: Big;

    init() {
        self.store = Big{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: "E",
            f: null,
            g: 7,
            h: true,
            i: null,
            j: null,
            k: "K",
            l: null
        };
    }
}
