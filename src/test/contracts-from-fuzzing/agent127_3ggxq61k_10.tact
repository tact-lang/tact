struct OptionalStruct {
    field: Int?;
}

contract OptionalStructField {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}