struct OptionalStruct {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract Test {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            foo: null,
            bar: null,
            baz: null
        };
    }
}