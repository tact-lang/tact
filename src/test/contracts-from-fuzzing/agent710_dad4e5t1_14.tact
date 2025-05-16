contract NoDefaults {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 5;
        self.b = false;
        self.c = "non-default";
    }
}