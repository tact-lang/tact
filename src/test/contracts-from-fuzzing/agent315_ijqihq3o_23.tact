struct OptionalStruct {
    val: Int;
    flag: Bool?;
}

contract NullableStructField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}