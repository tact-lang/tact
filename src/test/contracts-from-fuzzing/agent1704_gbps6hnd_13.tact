struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptPrimitivesHolder {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}