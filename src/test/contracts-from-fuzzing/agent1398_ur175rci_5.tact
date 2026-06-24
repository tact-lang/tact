struct OptionalFields {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

contract OptionalStructStorage {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            maybeInt: null,
            maybeBool: null,
            maybeString: null
        };
    }
}