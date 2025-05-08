struct OptionalsStruct {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalFields {
    data: OptionalsStruct;
    init() {
        self.data = OptionalsStruct{
            optInt: null,
            optBool: true,
            optString: null,
        };
    }
}