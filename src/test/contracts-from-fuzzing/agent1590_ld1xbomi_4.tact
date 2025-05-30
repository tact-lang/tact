struct OptionalStruct {
    val: Int;
    flag: Bool;
}

contract OptionalStructField {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}