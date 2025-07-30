struct OptionalFields {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract TestOptional {
    item: OptionalFields;
    
    init() {
        self.item = OptionalFields{
            val1: null,
            val2: true,
            val3: null,
        };
    }
}