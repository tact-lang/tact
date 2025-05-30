struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestOptionalStruct {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            foo: null,
            bar: true,
            baz: null
        };
    }
}
