struct OptionalStruct {
    x: Int;
}

contract OptionalStructField {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}