struct OptionalStruct {
    nested: Int;
}

contract OptionalStructHolder {
    foo: OptionalStruct?;

    init() {
        self.foo = null;
    }
}