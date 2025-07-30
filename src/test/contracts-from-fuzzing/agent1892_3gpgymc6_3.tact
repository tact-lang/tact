struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String;
    m: Int;
    n: Bool;
    o: String;
}

contract LargeStructHolder {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: null,
            f: "f",
            g: 7,
            h: false,
            i: "i",
            j: 10,
            k: true,
            l: "l",
            m: 13,
            n: true,
            o: "o",
        };
    }
}