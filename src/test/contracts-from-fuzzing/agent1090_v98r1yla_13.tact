struct OptionalNestedStruct {
    a: Int;
    b: Int?;
}

contract OptionalStructField {
    os: OptionalNestedStruct?;

    init() {
        self.os = null;
    }
}