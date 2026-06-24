contract SimpleDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";

    init() {
        self.a = 2;
        self.b = true;
        self.c = "def";
    }
}