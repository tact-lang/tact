struct OptionalStruct {
    a: Int;
}

contract OptionalStructField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}
