struct OptionalNest {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
    e: Cell?;
    f: Address?;
    g: String?;
    h: Bool?;
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
            h: null
        };
    }
}