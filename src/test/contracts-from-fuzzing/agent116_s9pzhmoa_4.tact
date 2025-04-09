struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalStorage {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}