struct OptionalStruct {
    foo: Int;
}

contract OptionalStructField {
    field: OptionalStruct?;

    init() {
        self.field = OptionalStruct{ foo: 999 };
    }
}
