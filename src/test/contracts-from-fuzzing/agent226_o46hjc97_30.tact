struct StringDefaultOpt {
    s1: String = "abc";
    s2: String?;
}

contract TestStringDefaultOpt {
    f: StringDefaultOpt;

    init() {
        self.f = StringDefaultOpt{ s2: null };
    }
}
