struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract WithInnerOptionalPrims {
    inner: OptionalPrimitives = OptionalPrimitives{
        a:null, b:null, c:null, d:null, e:null, f:null
    };
    init() {}
}
