struct StringWithDefaults {
    a: String = "a";
    b: String = "b";
    c: String = "c";
}

contract DefaultStrings {
    s: StringWithDefaults;

    init() {
        self.s = StringWithDefaults{};
    }
}