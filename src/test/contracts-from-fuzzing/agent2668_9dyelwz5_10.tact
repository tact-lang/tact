struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFieldsTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{ foo: null, bar: null, baz: null };
    }
}
