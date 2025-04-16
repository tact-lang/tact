struct OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalNestedContract {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            optInt: null,
            optBool: true,
            optString: null,
        };
    }
}
