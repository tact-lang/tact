struct OptionalContractField {
    x: Int?;
    s: String?;
    b: Bool?;
}

contract OptFieldTest {
    data: OptionalContractField;

    init() {
        self.data = OptionalContractField{ x: null, s: null, b: null };
    }
}