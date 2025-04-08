struct S {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract InitStruct {
    s: S;

    init() {
        self.s = S{
            a: 123,
            b: null,
            c: "hi",
            d: null,
        };
    }
}
