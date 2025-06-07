struct OptionalStruct {
    val1: Int?;
    val2: Bool?;
}

contract StorageWithNullable {
    os: OptionalStruct = OptionalStruct{
        val1: null,
        val2: null
    };

    init() {
        self.os = OptionalStruct{
            val1: 7,
            val2: true
        };
    }
}
