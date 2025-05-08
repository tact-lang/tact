struct OptionalStructWithOptionalField {
    optionalInner: Int?;
}

contract TopLevelOptional {
    optStruct: OptionalStructWithOptionalField?;

    init() {
        self.optStruct = null;
    }
}