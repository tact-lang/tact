contract SimpleMultiVar {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "hello";
        self.d = null;
        self.e = null;
    }
}