struct OptionalDefault {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultsOptionalField {
    prop: OptionalDefault;

    init() {
        self.prop = OptionalDefault{};
    }
}