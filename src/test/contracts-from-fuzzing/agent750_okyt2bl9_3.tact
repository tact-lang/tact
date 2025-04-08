struct OptionalStruct {
    field1: Int;
    field2: Bool;
}

contract OptionalInPersistent {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}
