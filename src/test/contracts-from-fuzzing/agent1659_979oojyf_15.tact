struct OptStrings {
    s1: String?;
    s2: String?;
}

contract C {
    f1: OptStrings?;
    f2: OptStrings?;
    f3: OptStrings?;
    f4: OptStrings?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }
}