struct OptionalNested {
    inner: Int?;
}

contract OptionalNestedField {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ inner: null };
    }
}