struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFields {
    data: OptStruct;
    init() {
        self.data = OptStruct{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}