struct OptionalInt {
    val: Int?;
}

contract NullInit {
    field: OptionalInt;

    init() {
        self.field = OptionalInt{ val: null };
    }
}