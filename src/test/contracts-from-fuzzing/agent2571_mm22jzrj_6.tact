struct S {
    a: Int;
    b: String;
    c: Bool?;
    d: String?;
}

contract OptFields {
    s: S;

    init() {
        self.s = S{
            a: 123,
            b: "abc",
            c: null,
            d: null,
        };
    }
}
