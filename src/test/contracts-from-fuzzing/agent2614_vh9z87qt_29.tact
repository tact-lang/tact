struct StringDefaults {
    s1: String = "one";
    s2: String = "two";
}

contract StringDefaultsContract {
    data: StringDefaults;

    init() {
        self.data = StringDefaults{};
    }
}