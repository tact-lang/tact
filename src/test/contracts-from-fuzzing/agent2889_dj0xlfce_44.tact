contract StringOptionals {
    s1: String? = null;
    s2: String? = "foo";

    init() {
        self.s1 = "abc";
        self.s2 = null;
    }
}