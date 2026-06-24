struct FixedOptional {
    maybeInt: Int? = null;
    maybeBool: Bool? = null;
    maybeStr: String? = null;
}

contract OptionalDefaults {
    data: FixedOptional;

    init() {
        self.data = FixedOptional{};
    }
}
