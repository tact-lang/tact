struct Inner {
    value: Int;
}

contract OptionalField {
    field1: Int?;
    field2: Inner?;
    field3: Bool?;

    init() {
        self.field1 = null;
        self.field2 = null;
        self.field3 = null;
    }
}