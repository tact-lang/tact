struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestOptionalPrimitives {
    storage: OptionalPrimitives;

    init() {
        self.storage = OptionalPrimitives{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}
