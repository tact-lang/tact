struct OptNested {
    content: Bool?;
}

contract OptionalNestedField {
    data: OptNested;

    init() {
        self.data = OptNested{content: null};
    }
}