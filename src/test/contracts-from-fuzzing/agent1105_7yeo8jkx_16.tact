struct OptionalStruct {
    foo: Int;
}

contract OptionalStructField {
    maybe: OptionalStruct?;
    init() {
        self.maybe = null;
    }
}