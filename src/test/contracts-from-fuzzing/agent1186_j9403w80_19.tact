struct OptionalStringDefault {
    s: String? = null;
}

contract OptionalDefaultField {
    f: OptionalStringDefault;

    init() {
        self.f = OptionalStringDefault{};
    }
}