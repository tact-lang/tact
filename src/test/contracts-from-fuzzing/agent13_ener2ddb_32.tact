contract EmptyStringDefaults {
    s1: String = "";
    s2: String;

    init() {
        self.s2 = "";
    }
}