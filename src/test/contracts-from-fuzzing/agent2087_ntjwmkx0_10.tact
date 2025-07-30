struct OnlyOptional {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalDefaults {
    field: OnlyOptional;

    init() {
        self.field = OnlyOptional{ optInt: null, optBool: null, optString: null };
    }
}