struct OptionalStruct {
    field: Int;
}

contract OptionalStructField {
    sField: OptionalStruct?;

    init() {
        self.sField = null;
    }
}