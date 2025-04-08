struct StringsDefaults {
    a: String = "apple";
    b: String = "banana";
}

contract StringsDefaultsPersist {
    s: StringsDefaults;

    init() {
        self.s = StringsDefaults{};
    }
}