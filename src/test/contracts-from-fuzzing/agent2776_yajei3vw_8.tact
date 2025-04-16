struct NestedStrings {
    s1: String;
    s2: String?;
}

contract TestStrings {
    f: NestedStrings?;

    init() {
        self.f = null;
    }
}
