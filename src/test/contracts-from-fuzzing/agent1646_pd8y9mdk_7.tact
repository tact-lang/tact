struct OptionalStruct {
    foo: Int;
}

contract OptionalStructField {
    foo: OptionalStruct?;
    init() {
        self.foo = null;
    }
}