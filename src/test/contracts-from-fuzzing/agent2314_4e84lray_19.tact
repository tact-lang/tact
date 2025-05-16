struct OptionalWithDefault {
    optionalField: Int? = null;
}

contract TestOptWithDefault {
    f: OptionalWithDefault;
    init() {
        self.f = OptionalWithDefault{};
    }
}