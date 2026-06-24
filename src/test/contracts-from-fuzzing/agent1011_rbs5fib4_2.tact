struct OptFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructFieldContract {
    data: OptFields;

    init() {
        self.data = OptFields{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}