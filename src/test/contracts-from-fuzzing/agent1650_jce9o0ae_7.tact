struct OptionalContainer {
    val: Int?;
}

contract OptionalIntDefault {
    field: OptionalContainer;

    init() {
        self.field = OptionalContainer{ val: null };
    }
}