struct ManyOptionalPrimitives {
    i: Int?;
    b: Bool?;
    a: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;
}

contract OptionalPrimitives {
    p: ManyOptionalPrimitives;

    init() {
        self.p = ManyOptionalPrimitives{
            i: null,
            b: null,
            a: null,
            s: null,
            c: null,
            sl: null,
        };
    }
}