struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
}

contract Test {
    optField: OptionalFields;

    init() {
        self.optField = OptionalFields{
            foo: null,
            bar: null,
            addr: null,
        };
    }
}