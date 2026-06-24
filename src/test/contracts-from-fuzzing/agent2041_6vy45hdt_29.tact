struct ContainsOptionalStruct {
    foo: Int;
    bar: String?;
}

contract OptionalStructField {
    os: ContainsOptionalStruct?;
    init() {
        self.os = null;
    }
}