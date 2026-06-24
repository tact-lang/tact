struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalStructContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optInt: null,
            optBool: null,
            optString: null,
        };
    }
}