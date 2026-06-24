struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Bool?;
    f: Int;
    g: Bool;
    h: String?;
    i: Int;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: null,
            c: true,
            d: "test",
            e: null,
            f: 42,
            g: false,
            h: null,
            i: -7
        };
    }
}