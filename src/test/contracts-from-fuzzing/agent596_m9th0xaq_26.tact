struct StringDefaults {
    s1: String = "";
    s2: String = "hello";
}

contract StrDef {
    s: StringDefaults;

    init() {
        self.s = StringDefaults{};
    }
}