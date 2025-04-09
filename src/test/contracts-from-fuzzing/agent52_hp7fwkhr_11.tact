struct StringDefaults {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
}

contract StructWithStringDefaults {
    s: StringDefaults;

    init() {
        self.s = StringDefaults{};
    }
}
