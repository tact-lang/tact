struct OptionalFields {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract NullableFields {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields {
            a: null,
            b: "hello",
            c: null,
            d: null
        };
    }
}