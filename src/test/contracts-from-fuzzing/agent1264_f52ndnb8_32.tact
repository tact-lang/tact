struct HasStr {
    s: String;
}

contract BigStrDefaults {
    s1: HasStr;
    s2: HasStr;

    init() {
        self.s1 = HasStr{ s: "a" };
        self.s2 = HasStr{ s: "b" };
    }
}