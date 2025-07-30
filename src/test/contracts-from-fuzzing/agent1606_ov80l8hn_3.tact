struct OptionalNested {
    num: Int?;
    text: String?;
}

contract OptionalStructField {
    optStruct: OptionalNested;

    init() {
        self.optStruct = OptionalNested{
            num: null,
            text: null
        };
    }
}
