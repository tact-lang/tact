struct OptionalFields {
    name: String = "default";
    description: String?;
    amount: Int?;
    active: Bool = true;
}

contract Test4 {
    info: OptionalFields;

    init() {
        self.info = OptionalFields{
            description: null,
            amount: null,
        };
    }
}