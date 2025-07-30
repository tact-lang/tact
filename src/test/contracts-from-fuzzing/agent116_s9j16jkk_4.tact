struct OptionalNested {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalFieldsContract {
    optData: OptionalNested;

    init() {
        self.optData = OptionalNested{
            optInt: null,
            optBool: true,
            optString: null,
        };
    }

    receive() {}
}