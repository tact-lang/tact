struct OptionalInStruct {
    val1: Int?;
    val2: Bool?;
}

contract NullableStructField {
    s: OptionalInStruct;

    init() {
        self.s = OptionalInStruct{
            val1: null,
            val2: null,
        };
    }
}
