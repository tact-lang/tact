struct OptionalStruct {
    nestedFlag: Bool;
}

contract OptionalStructPersistent {
    nested: OptionalStruct?;

    init() {
        self.nested = null;
    }
}