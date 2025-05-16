contract ComplexDefaults {
    a: Int = 1;
    b: String = "abc";
    c: Bool = false;

    init() {
        self.a = 2;
        self.b = "def";
        self.c = true;
    }
}
