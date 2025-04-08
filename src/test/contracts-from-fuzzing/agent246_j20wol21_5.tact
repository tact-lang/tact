struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
}

contract ManyFields {
    w: Wide;

    init() {
        self.w = Wide{
            a: 1,
            b: true,
            c: "c",
            d: 2,
            e: false,
            f: "f",
            g: 7,
            h: true,
            i: "i",
            j: 10,
            k: false,
            l: "l",
        };
    }
}
