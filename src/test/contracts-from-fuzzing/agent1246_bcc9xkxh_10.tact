struct OptionalStruct {
    someField: Int;
}

contract OptionalStructField {
    maybeStruct: OptionalStruct?;

    init() {
        self.maybeStruct = null;
    }
}
