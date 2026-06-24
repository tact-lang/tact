struct OptionalStruct {
    foo: Int;
}

contract TestContract {
    optionalField: OptionalStruct?;

    init() {
        self.optionalField = null;
    }
}
