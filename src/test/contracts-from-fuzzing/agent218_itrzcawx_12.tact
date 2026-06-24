struct OptionalPrimitives {
    a: Int?;
    b: Address?;
    c: Cell?;
    d: Slice?;
    e: Builder?;
    f: String?;
    g: Bool?;
}

contract OptionalPrimitiveFields {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}