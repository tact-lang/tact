struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract Test {
    mo: MultiOptional;

    init() {
        self.mo = MultiOptional{
            a: 10,
            b: null,
            c: "hello",
            d: null,
            e: null,
        };
    }
}
