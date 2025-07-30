struct OptionalDefaultInt {
    val: Int? = null;
}

contract TestOptionalDefault {
    field: OptionalDefaultInt;
    init() {
        self.field = OptionalDefaultInt{};
    }
}
