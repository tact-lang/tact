struct NestedOptionalStruct {
    x: Int?;
    y: String;
}

contract OptionalStructField {
    f: NestedOptionalStruct?;

    init() {
        self.f = null;
    }
}
