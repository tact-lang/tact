struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract OptionalSwap {
    s: S;

    init() {
        self.s = S {
            a: 1,
            b: false,
            c: null,
            d: null
        };
    }
}