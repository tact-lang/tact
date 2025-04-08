struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract OptionalContainer {
    field: NestedOptionals?;

    init() {
        self.field = null;
    }
}