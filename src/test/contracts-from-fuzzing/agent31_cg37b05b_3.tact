struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract OptionalHolder {
    manyOpts: ManyOptionalFields;

    init() {
        self.manyOpts = ManyOptionalFields{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}