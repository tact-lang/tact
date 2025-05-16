struct OptionalFields {
    first: Int?;
    second: Bool?;
    third: String?;
    fourth: Int?;
}

contract TestContract {
    optData: OptionalFields;

    init() {
        self.optData = OptionalFields{
            first: null,
            second: null,
            third: "hi",
            fourth: 42
        };
    }
}