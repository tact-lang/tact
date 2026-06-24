struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
    g: Builder?;
}

contract OptionalPrimitivesContract {
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