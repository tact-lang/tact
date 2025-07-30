contract ManyStringsOptional {
    a: String?;
    b: String?;
    c: String?;
    d: String?;
    e: String?;

    init() {
        self.a = null;
        self.b = "hello";
        self.c = null;
        self.d = "world";
        self.e = "!";
    }
}