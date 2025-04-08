struct OptionalStruct {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract OptionalFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}
