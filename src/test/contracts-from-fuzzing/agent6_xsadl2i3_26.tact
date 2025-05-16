struct Many {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyFields {
    m1: Many;
    m2: Many;
    init() {
        self.m1 = Many {
            a: 1,
            b: true,
            c: "a",
            d: null,
            e: null,
            f: null,
        };
        self.m2 = Many {
            a: 2,
            b: false,
            c: "b",
            d: null,
            e: null,
            f: null,
        };
    }
}