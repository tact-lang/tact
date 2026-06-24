struct ContainsOptionals {
    alpha: Int?;
    beta: String?;
    gamma: Bool?;
}

contract AllOptionalFields {
    data: ContainsOptionals;

    init() {
        self.data = ContainsOptionals{
            alpha: null,
            beta: null,
            gamma: true,
        };
    }
}