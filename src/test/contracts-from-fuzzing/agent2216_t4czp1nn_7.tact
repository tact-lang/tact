struct OptionalStruct {
    x: Int;
}

contract OptionalStructField {
    content: OptionalStruct?;
    init() {
        self.content = null;
    }
}
