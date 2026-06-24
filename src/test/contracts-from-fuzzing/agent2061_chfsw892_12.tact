struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: String;
    h: String?;
    i: Bool;
    j: Int;
    k: String?;
}

contract ManyFields {
    st: S;

    init() {
        self.st = S{
            a: 1, b: true, c: null, d: null, e: 5, f: false,
            g: "hi", h: null, i: true, j: 10, k: null,
        };
    }
}