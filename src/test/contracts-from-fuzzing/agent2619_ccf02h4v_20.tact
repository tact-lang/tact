contract StringMix {
    a: String;
    b: String?;
    c: String;
    d: String?;

    init() {
        self.a = "hello";
        self.b = null;
        self.c = "world";
        self.d = "!";
    }
}