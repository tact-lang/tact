struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract TestOptionalFields {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}