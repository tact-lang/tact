struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: String?;
}

contract OptionalPrimitiveFields {
    s: OptionalPrimitives;

    init() {
        self.s = OptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}