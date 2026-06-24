struct OptionalStruct {
    foo: Int;
}

contract OptionalField {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}
