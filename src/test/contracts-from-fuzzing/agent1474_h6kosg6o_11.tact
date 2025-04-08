contract EmptyStrings {
    s1: String = "";
    s2: String? = null;

    init() {
        self.s1 = "hello";
        self.s2 = "world";
    }
}
