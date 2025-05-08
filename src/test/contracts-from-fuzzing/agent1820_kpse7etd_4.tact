struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
}

contract TestContract {
    data: OptionalFields;
    init() {
        self.data = OptionalFields{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}