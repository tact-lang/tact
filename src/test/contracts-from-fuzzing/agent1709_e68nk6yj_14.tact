struct OptionalStruct {
    i: Int;
    s: String;
}

contract OptionalStructField {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}