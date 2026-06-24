struct OptionalStruct {
    value: Int;
}

contract OptionalStructStorage {
    maybeStruct: OptionalStruct?;

    init() {
        self.maybeStruct = null;
    }
}