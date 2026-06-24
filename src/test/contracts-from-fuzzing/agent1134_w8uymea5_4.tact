struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract TestOpt {
    optField: ManyOptionalFields;

    init() {
        self.optField = ManyOptionalFields{
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