struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract OptionalFieldsTest {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    nested: OptionalInner;

    init() {
        self.field1 = null;
        self.field2 = true;
        self.field3 = null;
        self.nested = OptionalInner{foo: null, bar: null};
    }
}