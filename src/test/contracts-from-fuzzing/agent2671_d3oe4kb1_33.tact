struct StringsDefaults {
    a: String = "a";
    b: String = "b";
    c: String = "c";
    d: String = "d";
}

contract DefaultsStr {
    val: StringsDefaults;

    init() {
        self.val = StringsDefaults{};
    }
}