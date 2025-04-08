struct OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    sl: Slice?;
    c: Cell?;
    bl: Builder?;
}

contract OptPrim {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            i: null,
            b: null,
            s: null,
            a: null,
            sl: null,
            c: null,
            bl: null
        };
    }
}