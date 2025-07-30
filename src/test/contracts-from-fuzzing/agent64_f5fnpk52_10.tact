struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: Bool?;
    k: String;
    l: String?;
}

contract ManyMixedFields {
    mixed: S;

    init() {
        self.mixed = S{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: "hello",
            f: null,
            g: 2,
            h: 3,
            i: true,
            j: null,
            k: "world",
            l: null
        };
    }

    receive() {
        self.mixed.a += 1;
    }
}