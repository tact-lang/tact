struct OptMix {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;
}

contract OptPrimitives {
    data: OptMix;

    init() {
        self.data = OptMix{
            i: null,
            b: null,
            s: null,
            a: null,
            c: null,
            sl: null,
            bu: null
        };
    }
}