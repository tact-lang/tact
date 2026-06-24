struct StrOpt {
    s1: String?;
    s2: String?;
}

contract OptionalStrings {
    so: StrOpt;

    init() {
        self.so = StrOpt{ s1: null, s2: null };
    }
}