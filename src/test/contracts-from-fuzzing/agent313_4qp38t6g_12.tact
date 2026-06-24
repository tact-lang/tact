struct StringDefaults {
    s1: String = "alpha";
    s2: String = "beta";
    s3: String = "gamma";
}

contract StringDefaultsTest {
    val: StringDefaults;

    init() {
        self.val = StringDefaults{};
    }
}