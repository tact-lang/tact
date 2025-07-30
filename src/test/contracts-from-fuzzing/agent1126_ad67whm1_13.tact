struct OptionalStruct {
    val: Int?;
}

contract StructOptField {
    field: OptionalStruct?;

    init() {
        self.field = null;
    }
}