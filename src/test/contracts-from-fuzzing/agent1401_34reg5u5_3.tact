struct OptStructFields {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
    val4: String?;
}

contract OptionalStructFieldTest {
    data: OptStructFields;
    
    init() {
        self.data = OptStructFields{
            val1: 77,
            val2: null,
            val3: null,
            val4: null,
        };
    }
}