struct OptionalStruct {
    num: Int;
}

contract OptionalStructField {
    maybeStruct: OptionalStruct?;

    init() {
        self.maybeStruct = null;
    }
}