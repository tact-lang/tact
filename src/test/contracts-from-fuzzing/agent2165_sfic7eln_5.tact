struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract Test5 {
    optData: OptionalFields;

    init() {
        self.optData = OptionalFields{
            foo: null,
            bar: true,
            baz: null
        };
    }
}