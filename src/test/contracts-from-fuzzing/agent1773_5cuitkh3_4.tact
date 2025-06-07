struct OptionalStruct {
    foo: Int;
    bar: Int;
}

contract OptionalInPersistent {
    optionalField: OptionalStruct?;

    init() {
        self.optionalField = null;
    }
}