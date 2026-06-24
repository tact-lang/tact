struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalNestedField {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}