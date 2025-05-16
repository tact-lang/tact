struct OptionalStruct {
    field: Int;
}

contract OptionalStructField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}