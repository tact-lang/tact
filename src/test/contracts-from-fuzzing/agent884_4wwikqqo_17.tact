struct StringDefaults {
    s1: String = "aaa";
    s2: String = "bbb";
}

contract StrDefContract {
    data: StringDefaults;

    init() {
        self.data = StringDefaults{};
    }
}