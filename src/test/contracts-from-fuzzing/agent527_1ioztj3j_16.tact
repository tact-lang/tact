struct StringDefaulted {
    s1: String = "hello";
    s2: String = "world";
}

contract StringDefaults {
    field: StringDefaulted;
    init() {
        self.field = StringDefaulted{};
    }
}