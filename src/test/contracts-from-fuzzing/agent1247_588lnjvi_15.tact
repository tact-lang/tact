struct OptionalStruct {
    flag: Bool;
}

contract DirectOptionalTest {
    optionalField: OptionalStruct?;

    init() {
        self.optionalField = null;
    }
}