struct OptionalPrimitiveStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract StructOptionalPrimitivePersistent {
    s: OptionalPrimitiveStruct;

    init() {
        self.s = OptionalPrimitiveStruct{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}
