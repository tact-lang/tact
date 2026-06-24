struct OptionalNested {
    inner: Int?;
}

contract OptionalNestedField {
    fancy: OptionalNested;

    init() {
        self.fancy = OptionalNested{
            inner: null
        };
    }
}