struct OptInStruct {
    val: Int?;
}

contract NullableStructField {
    data: OptInStruct? = null;

    receive() {
        self.data = OptInStruct{ val: 123 };
    }
}