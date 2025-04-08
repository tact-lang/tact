struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptionalPrimitivesDefaultNull {
    s: OptionalPrimitives = OptionalPrimitives{
        a: null, b: null, c: null, d: null, e: null, f: null
    };
}