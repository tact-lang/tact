struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFieldsTest {
    val: OptionalFields;
    init() {
        self.val = OptionalFields{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}