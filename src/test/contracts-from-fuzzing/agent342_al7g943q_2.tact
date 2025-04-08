struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptionalPrimitiveContract {
    optField: OptionalPrimitives;

    init() {
        self.optField = OptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}
