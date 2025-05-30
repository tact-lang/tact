struct OptionalNested {
    num: Int?;
    text: String?;
}

contract OptionalNestedStructField {
    test: OptionalNested?;
    init() {
        self.test = null;
    }
}
