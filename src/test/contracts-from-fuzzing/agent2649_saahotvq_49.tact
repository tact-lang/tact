struct OptStrDefaults {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;
}

contract OptStrDefTest {
    val: OptStrDefaults;

    init() {
        self.val = OptStrDefaults{};
    }
}