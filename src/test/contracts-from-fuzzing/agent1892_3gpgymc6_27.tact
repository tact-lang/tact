struct StringDefaults {
    s1: String = "abc";
    s2: String = "def";
}

contract DefaultsString {
    val: StringDefaults;

    init() {
        self.val = StringDefaults{};
    }
}