struct OptionalStruct {
    x: Int;
}

contract OptionalStructField {
    maybe: OptionalStruct?;

    init() {
        self.maybe = null;
    }
}
