struct OptFields {
    foo: Int?;
    bar: String?;
}

contract InitNullFields {
    data: OptFields;

    init() {
        self.data = OptFields{
            foo: null,
            bar: null,
        };
    }
}