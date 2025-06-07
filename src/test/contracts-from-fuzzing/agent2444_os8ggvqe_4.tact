struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldStorage {
    optionalData: OptionalStruct?;

    init() {
        self.optionalData = null;
    }
}
