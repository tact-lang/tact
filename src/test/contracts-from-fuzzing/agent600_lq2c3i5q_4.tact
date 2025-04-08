struct OptionalStruct {
    x: Int;
}

contract OptionalStructField {
    maybeData: OptionalStruct?;

    init() {
        self.maybeData = null;
    }
}