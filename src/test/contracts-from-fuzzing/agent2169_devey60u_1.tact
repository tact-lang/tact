struct NestedOptionalTest {
    field1: Int?;
    field2: String?;
}

contract OptionalStructStorage {
    nested: NestedOptionalTest?;

    init() {
        self.nested = null;
    }
}