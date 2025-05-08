struct OptStruct {
    v: Int;
}

contract OptionalStructField {
    maybe: OptStruct?;

    init() {
        self.maybe = null;
    }
}
