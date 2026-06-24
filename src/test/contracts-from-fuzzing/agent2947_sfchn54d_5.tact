struct ComplexOption {
    val1: Int?;
    val2: String?;
    val3: Address?;
}

contract OptionFields {
    field: ComplexOption;

    init() {
        self.field = ComplexOption {
            val1: null,
            val2: null,
            val3: null
        };
    }
}