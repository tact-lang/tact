struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract ManyOptionalFieldsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ foo: null, bar: null, baz: null };
    }
}