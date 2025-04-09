struct OptionalInner {
    innerVal: Int;
}

contract StructOptionalField {
    optStruct: OptionalInner?;

    init() {
        self.optStruct = OptionalInner{ innerVal: 123 };
    }
}