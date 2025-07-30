contract LongStringsAndBools {
    a: String;
    b: String;
    c: String;
    d: Bool;
    e: Bool;

    init() {
        self.a = "123456789012345678901234567890";
        self.b = "anotherlongstringhere";
        self.c = "";
        self.d = true;
        self.e = false;
    }
}