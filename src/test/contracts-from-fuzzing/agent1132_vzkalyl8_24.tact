struct OptionalFields {
    first: Int?;
    second: String?;
    third: Bool?;
}

contract OptionalStructContract {
    state: OptionalFields = OptionalFields{first: 1, second: null, third: true};
}