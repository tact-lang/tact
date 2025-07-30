struct OptionalStruct {
    foo: Int;
}

contract OptionalPersists {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
    receive() {
        self.data = OptionalStruct{ foo: 123 };
    }
}