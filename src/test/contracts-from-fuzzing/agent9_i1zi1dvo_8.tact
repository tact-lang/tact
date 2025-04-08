struct OptionalNestedStruct {
    nested: Int;
}

contract OptionalStructPersistent {
    optStruct: OptionalNestedStruct?;
    init() {
        self.optStruct = null;
    }
}