struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}