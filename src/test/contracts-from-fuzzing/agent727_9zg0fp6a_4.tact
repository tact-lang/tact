struct OptionalNested {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
}

contract OptionalNestedContract {
    nested: OptionalNested?;

    init() {
        self.nested = OptionalNested{
            val1: null,
            val2: null,
            val3: null,
        };
    }
}