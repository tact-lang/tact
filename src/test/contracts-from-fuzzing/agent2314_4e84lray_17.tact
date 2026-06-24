struct OptionalStruct {
    val: Int;
}

contract TestOptionalStructField {
    field: OptionalStruct?;
    init() {
        self.field = null;
    }
}