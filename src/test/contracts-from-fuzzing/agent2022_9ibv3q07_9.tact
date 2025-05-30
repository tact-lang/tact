struct HasOptionalWithDefault {
    num: Int? = null;
    text: String? = null;
}

contract OptDefaults {
    data: HasOptionalWithDefault;

    init() {
        self.data = HasOptionalWithDefault{};
    }
}