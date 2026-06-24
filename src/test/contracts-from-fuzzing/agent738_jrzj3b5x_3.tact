struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFields {
    st: OptStruct;

    init() {
        self.st = OptStruct{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}
