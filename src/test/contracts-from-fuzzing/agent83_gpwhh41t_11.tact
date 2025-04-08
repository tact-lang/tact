struct OptionalPrimitives {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: Slice?;
    str: String?;
}

contract OptionalVariety {
    data: OptionalPrimitives;
    init() {
        self.data = OptionalPrimitives{
            i: null,
            b: null,
            a: null,
            c: null,
            s: null,
            str: null
        };
    }
}
