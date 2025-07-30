struct StrDefaults {
    s1: String = "s1";
    s2: String = "s2";
    s3: String = "s3";
    s4: String = "s4";
}

contract ManyDefaultStrings {
    s: StrDefaults;

    init() {
        self.s = StrDefaults{};
    }
}
