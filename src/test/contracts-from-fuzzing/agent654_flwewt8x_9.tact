struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Int?;
    i: String;
    j: Bool;
}

contract TestContract {
    deep: Deep;
    init() {
        self.deep = Deep{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: false,
            f: "y",
            g: 7,
            h: null,
            i: "z",
            j: true
        };
    }
}