struct OptionalNested {
    v: Int?;
}

contract OptionalStructField {
    optStruct: OptionalNested?;
    init() {
        self.optStruct = null;
    }
}
