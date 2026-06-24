struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            foo: null, bar: true, baz: null
        };
    }
}