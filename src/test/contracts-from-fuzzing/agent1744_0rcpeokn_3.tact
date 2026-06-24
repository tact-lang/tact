struct OptionalStruct {
    foo: Int;
}

contract OptionalStore {
    maybe: OptionalStruct?;

    init() {
        self.maybe = null;
    }
}