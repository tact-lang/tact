struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Bool;
    h: Int;
    i: String?;
    j: Bool;
}

contract WideStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: false,
            f: "y",
            g: true,
            h: 8,
            i: null,
            j: false
        };
    }
}