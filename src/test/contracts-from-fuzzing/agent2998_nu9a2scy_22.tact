struct StrDefaults {
    s1: String = "abc";
    s2: String = "def";
    s3: String?;
}

contract StringDefaultsTest {
    field: StrDefaults;
    init() {
        self.field = StrDefaults{};
    }
}