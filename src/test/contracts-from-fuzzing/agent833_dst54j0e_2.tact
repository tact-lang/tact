struct OptionalFields {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    optionalData: OptionalFields;

    init() {
        self.optionalData = OptionalFields{};
    }
}
