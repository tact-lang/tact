struct OptionalBool {
    val: Bool?;
}

contract DefaultNullOptional {
    field: OptionalBool;

    init() {
        self.field = OptionalBool{ val: null };
    }
}