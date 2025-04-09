struct InnerOptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract OptionalDefaults {
    f: InnerOptDefaults;

    init() {
        self.f = InnerOptDefaults{};
    }
}