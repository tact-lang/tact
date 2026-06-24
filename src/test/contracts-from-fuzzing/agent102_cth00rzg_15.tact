struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptionalsPrimitivesFields {
    field: OptionalPrimitives;

    init() {
        self.field = OptionalPrimitives{
            a: null, b: true, c: "hi", d: null, e: null
        };
    }
}