struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract FlatFields {
    data: Flat;

    init() {
        self.data = Flat{
            a: 1,
            b: true,
            c: "x",
            d: 4,
            e: "y",
            f: null,
            g: 7,
            h: false,
            i: "z",
            j: null,
        };
    }
}