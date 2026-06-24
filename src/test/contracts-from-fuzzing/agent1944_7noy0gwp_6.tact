struct OptionalStruct {
    x: Int;
}

contract OptionalPersistent {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}