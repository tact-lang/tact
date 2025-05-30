struct OptionalInner {
    text: String?;
    number: Int?;
}

contract OptionalNestedStructField {
    optData: OptionalInner;

    init() {
        self.optData = OptionalInner{
            text: null,
            number: 42
        };
    }
}