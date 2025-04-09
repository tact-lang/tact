struct OptionalNested {
    val: Int?;
    text: String;
}

contract OptionalNestedStorage {
    nested: OptionalNested?;

    init() {
        self.nested = null;
    }
}
