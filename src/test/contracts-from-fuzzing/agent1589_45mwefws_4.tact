struct OptionalNested {
    x: Int?;
    y: Bool?;
}

contract OptionalNestedHolder {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested{ x: null, y: null };
    }
}