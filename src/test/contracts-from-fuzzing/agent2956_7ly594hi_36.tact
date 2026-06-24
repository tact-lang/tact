struct StrDefaults {
    a: String = "apple";
    b: String = "banana";
    c: String = "cucumber";
}

contract DefString {
    val: StrDefaults;

    init() {
        self.val = StrDefaults{};
    }
}
