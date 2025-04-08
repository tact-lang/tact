contract InitDefaults {
    c1: Int = 10;
    c2: Bool = true;
    c3: String = "abc";
    c4: Int? = null;
    c5: Bool? = null;
    c6: String? = null;

    init() {
        self.c1 = 15;
        self.c2 = false;
        self.c3 = "def";
        self.c4 = null;
        self.c5 = null;
        self.c6 = null;
    }
}