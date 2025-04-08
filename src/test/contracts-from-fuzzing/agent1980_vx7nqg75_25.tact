struct ManyOptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract ManyOpts {
    data: ManyOptionalPrimitives;

    init() {
        self.data = ManyOptionalPrimitives{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}