contract NestedStrings {
    s1: String = "a";
    s2: String = "b";
    optS1: String?;
    optS2: String?;
    b: Bool = true;

    init() {
        self.optS1 = null;
        self.optS2 = null;
    }
}