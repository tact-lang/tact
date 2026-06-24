struct OptionalInt {
    val: Int?;
}

contract OptionalIntDefault {
    field: OptionalInt;

    init() {
        self.field = OptionalInt{ val: null };
    }
}