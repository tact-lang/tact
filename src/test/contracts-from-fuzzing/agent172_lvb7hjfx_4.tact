struct S {
    a: Int;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            a: 10,
            b: null,
            c: null,
            d: null
        };
    }
}