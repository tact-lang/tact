struct StringsWithDefaults {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
}

contract DefaultsStringsStruct {
    field: StringsWithDefaults;

    init() {
        self.field = StringsWithDefaults{};
    }
}