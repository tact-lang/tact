struct OptionDefault {
    o: Int? = null;
}

contract OptionalWithDefault {
    field: OptionDefault;
    init() {
        self.field = OptionDefault{};
    }
}