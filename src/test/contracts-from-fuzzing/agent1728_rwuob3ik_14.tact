struct OptionalWrap {
    nested: String?;
}

contract TestContract {
    field1: Int?;
    field2: Bool?;
    field3: OptionalWrap;

    init() {
        self.field1 = null;
        self.field2 = null;
        self.field3 = OptionalWrap{ nested: null };
    }
}