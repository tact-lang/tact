struct OptionalBoolInt {
    i: Int? = null;
    b: Bool? = null;
}

contract BoolIntDefaults {
    val: OptionalBoolInt;

    init() {
        self.val = OptionalBoolInt{};
    }
}