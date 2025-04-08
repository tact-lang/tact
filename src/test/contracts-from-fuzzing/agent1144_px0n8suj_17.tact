// test String in nested struct with default
struct StrDefaults {
    s1: String = "abc";
    s2: String = "def";
}

contract StrDefaultContract {
    d: StrDefaults;

    init() {
        self.d = StrDefaults{};
    }
}