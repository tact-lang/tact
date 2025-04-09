struct OptionalNested {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract NestedWithOptionals {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{ x: null, y: null, s: null };
    }
}
