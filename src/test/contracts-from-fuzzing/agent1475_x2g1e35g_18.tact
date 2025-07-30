contract OnlyStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;

    init() {
        self.a = "A";
        self.b = null;
        self.c = "C";
        self.d = null;
    }
}