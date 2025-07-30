struct OptionalFieldsStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructStorage {
    optVal: OptionalFieldsStruct;

    init() {
        self.optVal = OptionalFieldsStruct{
            foo: null,
            bar: true,
            baz: "hello"
        };
    }
}