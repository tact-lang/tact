struct DefaultStrings {
    s1: String = "s1";
    s2: String = "s2";
    s3: String = "s3";
}
contract DefaultsAndInit {
    d: DefaultStrings;
    init() {
        self.d = DefaultStrings{};
    }
}