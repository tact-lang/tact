struct WithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalStructField {
    field: WithOptionals;

    init() {
        self.field = WithOptionals{
            optInt: null,
            optBool: true,
            optString: null,
        };
    }
}