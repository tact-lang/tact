contract EmptyStringDefaults {
    s1: String = "";
    s2: String = "initial";

    init() {
        self.s1 = "a";
        self.s2 = "b";
    }
}
