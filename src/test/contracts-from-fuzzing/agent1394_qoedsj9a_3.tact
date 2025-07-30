struct OptionalNested {
    x: Int?;
    y: Bool?;
}

contract OptNestedVar {
    s: OptionalNested;
    init() {
        self.s = OptionalNested{ x: null, y: true };
    }
}
