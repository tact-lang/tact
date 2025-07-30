struct OptionStruct {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalFields {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            optInt: null,
            optBool: true,
            optString: null
        };
    }
}