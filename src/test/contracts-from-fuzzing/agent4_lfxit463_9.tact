struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedFields {
    s: S;
    i: Int;
    b: Bool;
    s2: String;

    init() {
        self.s = S{
            a: 5,
            b: true,
            c: "hi",
            d: null,
            e: false,
            f: null,
        };
        self.i = 1;
        self.b = false;
        self.s2 = "yo";
    }
}