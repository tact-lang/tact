struct OptionalStruct {
    field1: Int;
    field2: Int?;
}

contract OptionalStructField {
    x: OptionalStruct?;

    init() {
        self.x = null;
    }
}
