struct InnerStruct {
    a: Int;
    b: String;
}

contract OptionalNestedStructField {
    data: InnerStruct?;

    init() {
        self.data = null;
    }
}
