struct OptionalBoolAndInt {
    val1: Bool?;
    val2: Int?;
}

contract OptBoolInt {
    field: OptionalBoolAndInt;
    init() {
        self.field = OptionalBoolAndInt{
            val1: null,
            val2: null
        };
    }
}