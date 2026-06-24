struct OptionalHeavy {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestOptionalHeavy {
    heavy: OptionalHeavy;

    init() {
        self.heavy = OptionalHeavy{
            a: null,
            b: true,
            c: null,
            d: 42,
            e: null,
            f: "foobar",
        };
    }
}