struct StringDefaults {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
}

contract ContractStringDefaults {
    st: StringDefaults;

    init() {
        self.st = StringDefaults{};
    }
}