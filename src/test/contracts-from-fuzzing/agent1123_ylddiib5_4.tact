struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFieldsContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct {
            foo: null,
            bar: true,
            baz: null
        };
    }
}