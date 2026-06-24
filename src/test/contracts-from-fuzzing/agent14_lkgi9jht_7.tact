struct OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            optInt: null,
            optBool: true,
            optStr: null,
        };
    }
}