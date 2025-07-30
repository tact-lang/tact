struct OptionalNest {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Int?;
}

contract OptionalFields {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}