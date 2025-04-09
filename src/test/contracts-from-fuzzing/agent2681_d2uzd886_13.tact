contract NoDefaults {
    a: Int;
    b: String;
    c: Bool;

    init() {
        self.a = 1;
        self.b = "abc";
        self.c = true;
    }
}