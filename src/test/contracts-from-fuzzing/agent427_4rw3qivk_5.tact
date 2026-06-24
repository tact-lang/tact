struct OptionalInner {
    data: Int?;
}

contract OptionalNestedStorage {
    optionalStruct: OptionalInner;

    init() {
        self.optionalStruct = OptionalInner{
            data: null
        };
    }
}