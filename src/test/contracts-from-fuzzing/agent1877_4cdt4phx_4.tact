struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract OptPrimStore {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
