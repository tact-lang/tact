struct S {
    a: Int;
    b: Int?;
    c: Bool?;
    d: String;
    e: String?;
}

contract OptionalMix {
    data: S;

    init() {
        self.data = S{
            a: 42,
            b: null,
            c: null,
            d: "ok",
            e: null
        };
    }
}