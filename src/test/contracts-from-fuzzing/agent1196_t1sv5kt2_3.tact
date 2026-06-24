struct OptionalNested {
    x: Int?;
    y: String?;
}

contract OptionalNestedField {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            x: null,
            y: null,
        };
    }
}