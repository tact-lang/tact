struct OptionalStruct {
    a: Int;
}

contract PersistenceWithOptionalStruct {
    foo: OptionalStruct?;

    init() {
        self.foo = null;
    }
}
