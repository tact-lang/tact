struct NullablePrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;
    addr: Address?;
}

contract PrimitiveOptionalFields {
    val: NullablePrimitives;

    init() {
        self.val = NullablePrimitives{
            i: null,
            b: null,
            s: null,
            c: null,
            sl: null,
            bu: null,
            addr: null,
        };
    }
}