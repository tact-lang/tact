struct StringDefaults {
    s1: String = "default1";
    s2: String = "default2";
}

contract DefaultStrings {
    f: StringDefaults;

    init() {
        self.f = StringDefaults{};
    }
}