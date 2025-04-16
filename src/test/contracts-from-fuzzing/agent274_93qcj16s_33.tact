struct StringOptionDefault {
    s: String? = null;
}

contract DefaultOptionalString {
    f: StringOptionDefault;

    init() {
        self.f = StringOptionDefault{};
    }
}