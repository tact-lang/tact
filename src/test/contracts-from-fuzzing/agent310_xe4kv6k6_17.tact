struct OptionalStruct {
    x: Int;
}

contract OptionalStructField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}