struct OptionalFields {
    first: Int?;
    second: Bool?;
    third: Address?;
    fourth: String?;
}

contract OptionalStructInState {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            first: null,
            second: null,
            third: null,
            fourth: null
        };
    }
}