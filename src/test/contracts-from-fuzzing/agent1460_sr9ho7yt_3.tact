struct OptionalStruct {
    foo: Int;
}

contract NullableStructField {
    param: OptionalStruct?;

    init() {
        self.param = null;
    }
}
