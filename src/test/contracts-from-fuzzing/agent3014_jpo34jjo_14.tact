struct OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    addr: Address?;
}

contract TestContract {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            i: null,
            b: null,
            s: null,
            c: null,
            sl: null,
            addr: null,
        };
    }
}