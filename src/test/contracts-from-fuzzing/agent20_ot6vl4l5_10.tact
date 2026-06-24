struct OptionalStruct {
    foo: Int;
}

contract OptStructField {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}