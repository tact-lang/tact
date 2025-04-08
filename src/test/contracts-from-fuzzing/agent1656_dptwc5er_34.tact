contract BasicFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "hello";
        self.d = 5;
        self.e = null;
    }
}
