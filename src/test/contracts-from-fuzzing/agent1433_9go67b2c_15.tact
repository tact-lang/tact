struct OptStruct {
    foo: Int?;
}

contract NullableStructField {
    s: OptStruct?;

    init() {
        self.s = null;
    }
}
