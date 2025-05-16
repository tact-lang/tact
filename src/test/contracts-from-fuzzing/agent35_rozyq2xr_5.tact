struct NullableStruct {
    x: Int;
    y: Int;
}

contract OptionalField {
    maybeStruct: NullableStruct?;
    init() {
        self.maybeStruct = null;
    }
}