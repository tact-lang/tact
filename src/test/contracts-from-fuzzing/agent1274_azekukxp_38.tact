struct OptionalStruct {
    inner: Int;
}

contract TestNestedOptional {
    os: OptionalStruct?;

    init() {
        self.os = null;
    }
}