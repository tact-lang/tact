contract DefaultValues {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
    d: Int = 6;
    e: Bool = false;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "def";
        self.d = 12;
        self.e = true;
    }
}