struct OptionalStruct {
    x: Int;
}

contract OptionalStructField {
    field: OptionalStruct?;

    init() {
        self.field = OptionalStruct{ x: 5 };
    }
}