struct OptLevel {
    val: Int?;
}

contract OptionalField {
    nested: OptLevel;

    init() {
        self.nested = OptLevel{
            val: null,
        };
    }
}