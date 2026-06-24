struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String;
    g: String;
    h: String;
    i: Bool;
    j: Int?;
}

contract LargeFields {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "e",
            f: "f",
            g: "g",
            h: "h",
            i: true,
            j: null,
        };
    }
}