struct OptionalStruct {
    a: Int;
    b: String?;
}

contract OptionalStructField {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}