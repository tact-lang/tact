struct OptionalStruct {
    x: Int;
    y: Int;
}

contract OptionalField {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}