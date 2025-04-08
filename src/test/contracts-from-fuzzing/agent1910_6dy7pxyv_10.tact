struct OptionalStruct {
    foo: Int;
}

contract WithOptionalStruct {
    maybeStruct: OptionalStruct?;

    init() {
        self.maybeStruct = null;
    }
}
