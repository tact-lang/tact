contract OverwriteDefaults {
    a: Int = 2;
    b: Bool = false;
    c: String = "abc";

    init() {
        self.a = 100;
        self.b = true;
        self.c = "zzz";
    }
}