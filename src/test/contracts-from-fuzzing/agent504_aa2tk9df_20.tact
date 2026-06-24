struct StringDefaults {
    s1: String = "abc";
    s2: String = "def";
}

contract StringDefaultsTest {
    val: StringDefaults;

    init() {
        self.val = StringDefaults{};
    }
}