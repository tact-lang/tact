contract DefaultEmptyString {
    s1: String = "";
    s2: String = "";
    init() {
        self.s1 = "foo";
        self.s2 = "";
    }
}