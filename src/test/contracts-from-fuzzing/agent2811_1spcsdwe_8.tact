struct OptionalStruct {
    x: Int;
}

contract FieldIsOptionalStruct {
    field: OptionalStruct?;

    init() {
        self.field = null;
    }
}