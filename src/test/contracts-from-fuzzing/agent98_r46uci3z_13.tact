struct StrDefaults {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
}

contract StringDefaultsContract {
    sd: StrDefaults;

    init() {
        self.sd = StrDefaults{};
    }
}