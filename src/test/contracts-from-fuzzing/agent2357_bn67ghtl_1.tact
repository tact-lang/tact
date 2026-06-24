struct WithManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
    f: Slice?;
}

contract OptionalFieldsContract {
    complex: WithManyOptionalFields;

    init() {
        self.complex = WithManyOptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}
