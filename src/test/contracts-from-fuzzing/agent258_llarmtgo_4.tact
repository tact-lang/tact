struct HasOptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optString: String?;
}

contract TestContract {
    data: HasOptionalFields;

    init() {
        self.data = HasOptionalFields {
            optInt: 42,
            optBool: true,
            optAddress: null,
            optString: "hello",
        };
    }
}