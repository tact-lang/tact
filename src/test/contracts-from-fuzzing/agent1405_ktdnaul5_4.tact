struct OptionalInner {
    optionalVal: Int?;
}

contract InnerWithOptionalStruct {
    optStruct: OptionalInner;

    init() {
        self.optStruct = OptionalInner{ optionalVal: null };
    }
}