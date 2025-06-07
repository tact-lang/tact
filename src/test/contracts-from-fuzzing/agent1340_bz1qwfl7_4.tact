struct OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalStruct {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            optInt: null,
            optBool: true,
            optString: "hello",
        };
    }
}