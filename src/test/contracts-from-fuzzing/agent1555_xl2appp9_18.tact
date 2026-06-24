struct OptionalStruct {
    foo: Int;
}

contract OptStructField {
    field: OptionalStruct?;

    init() {
        self.field = null;
    }
}
