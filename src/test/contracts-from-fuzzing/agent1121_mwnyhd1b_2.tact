struct OptionalFieldsStruct {
    foo: Int?;
    bar: Bool?;
}

contract TestOptionalFields {
    state: OptionalFieldsStruct;

    init() {
        self.state = OptionalFieldsStruct{
            foo: null,
            bar: true,
        };
    }
}