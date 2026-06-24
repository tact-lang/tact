contract DefaultAndOpt {
    a: Int = 5;
    b: Int? = null;
    c: String = "abc";
    d: String? = null;

    init() {
        self.a = 6;
        self.b = 7;
        self.c = "zzz";
        self.d = "xxx";
    }
}
