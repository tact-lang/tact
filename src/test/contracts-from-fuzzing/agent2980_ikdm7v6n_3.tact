struct S {
    a: Int;
    b: Bool;
    c: String;
    d: String?;
    e: Bool?;
    f: Int?;
    g: Int as int16;
    h: Int as uint8;
    i: String;
    j: Int as uint32;
    k: Int;
    l: Bool;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: 3,
            h: 4,
            i: "x",
            j: 123,
            k: 5,
            l: false,
        };
    }
}