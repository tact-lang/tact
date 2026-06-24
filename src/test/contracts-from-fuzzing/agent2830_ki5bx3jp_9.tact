struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
    k: String?;
}

contract ManyFields {
    storage: Big;
    init() {
        self.storage = Big{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: null,
            f: false,
            g: 7,
            h: "h",
            i: false,
            j: null,
            k: null
        };
    }
}