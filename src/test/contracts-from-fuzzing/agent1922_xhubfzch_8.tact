contract DefaultValues {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: String? = null;

    init() {
        self.a = 20;
        self.b = true;
        self.c = "def";
        self.d = 100;
        self.e = "zzz";
    }
}