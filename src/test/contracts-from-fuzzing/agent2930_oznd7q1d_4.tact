struct OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
}

contract OptionalStructField {
    field: OptionalFields;

    init() {
        self.field = OptionalFields{
            optInt: null,
            optBool: null,
            optString: null,
            optAddress: null,
        };
    }
}
