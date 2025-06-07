contract OnlyStrings {
    a: String;
    b: String?;
    c: String;

    init() {
        self.a = "hello";
        self.b = null;
        self.c = "world";
    }
}