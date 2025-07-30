struct StrDefaults {
    a: String = "a";
    b: String = "b";
    c: String = "c";
}

contract StrDefaultsContract {
    data: StrDefaults;

    init() {
        self.data = StrDefaults{};
    }
}
